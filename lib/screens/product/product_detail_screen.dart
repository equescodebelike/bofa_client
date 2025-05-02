import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/service/favorites_service.dart';
import '../../bloc/product_detail/product_detail_barrel.dart';
import '../../bloc/auth/auth_barrel.dart';
import '../../bloc/cart/cart_barrel.dart';
import '../../data/dto/product_dto.dart';
import '../../theme/app_typography.dart';
import '../../theme/color_const.dart';
import '../ui_kit/custom_filled_button.dart';
import '../../navigation/app_router.dart';
import 'product_form_screen.dart';

@RoutePage()
class ProductDetailScreen extends StatelessWidget {
  final int productId;
  final String productName;

  const ProductDetailScreen({
    super.key,
    required this.productId,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    // Fetch the product details when the screen is built
    context.read<ProductDetailBloc>().add(FetchProductDetail(productId));

    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        // if (state is CartAuthRequired) {
        //   // Navigate to auth screen when authentication is required
        //   context.router.pushNamed('/auth/email');
          
        // } 
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            productName,
            style: AppTypography.personalCardTitle,
          ),
          centerTitle: true,
          leading: IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.comfortable,
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.black,
            ),
          ),
        ),
        body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            if (state is ProductDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductDetailLoaded) {
              return _buildProductDetails(context, state.product);
            } else if (state is ProductDetailError) {
              return Center(
                child: Text(
                  'Error: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const Center(
                child: Text('Product not found'),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildProductDetails(BuildContext context, ProductDTO product) {
    // Get current user from AuthBloc
    final authState = context.watch<AuthBloc>().state;
    final bool isOwner = authState is AuthSuccess && authState.user != null && authState.user!.userId == product.userId;

    // Check if product is in cart
    final cartState = context.watch<CartBloc>().state;
    final bool isInCart =
        cartState is CartLoaded && cartState.cart.items.any((item) => item.productId == product.productId);

    return SafeArea(
      minimum: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          // Product image
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                height: 273,
                width: 273,
                imageUrl: product.imageUrl ?? '',
                fit: BoxFit.cover,
                progressIndicatorBuilder: (_, __, ___) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorWidget: (_, __, ___) {
                  return Image.asset(
                    'assets/image/empty_photo.png',
                  );
                },
              ),
            ],
          ),

          // Product name and cost
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            child: Text(
              product.name,
              style: AppTypography.personalCardTitle,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            '${product.cost.toStringAsFixed(2)} ₽ / ${product.units}',
            style: AppTypography.personalCardTitle,
          ),

          // Spacer to push buttons to bottom
          const Spacer(),

          // Action buttons
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                // Favorite button
                FutureBuilder<bool>(
                  future: FavoritesService().isFavorite(product.productId!),
                  builder: (context, snapshot) {
                    bool isFavorite = snapshot.data ?? false;
                    
                    return GestureDetector(
                      onTap: () async {
                        final favoritesService = FavoritesService();
                        final newState = await favoritesService.toggleFavorite(product.productId!);
                        
                        // Force rebuild to update UI
                        context.read<ProductDetailBloc>().add(FetchProductDetail(productId));
                        
                        // Show feedback to user
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              newState 
                                ? 'Добавлено в избранное' 
                                : 'Удалено из избранного'
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.favorite,
                        color: isFavorite ? Colors.red : Colors.grey,
                        size: 24,
                      ),
                    );
                  },
                ),

                const SizedBox(width: 20),

                // Show Edit/Delete buttons only if user is the owner
                if (isOwner) ...[
                  // Edit button
                  SizedBox(
                    width: 130,
                    child: CustomFilledButton(
                      text: 'Edit',
                      onTap: () {
                        // Navigate to edit product screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductFormScreen(
                              product: product,
                            ),
                          ),
                        ).then((_) {
                          // Refresh product details when returning from form
                          context.read<ProductDetailBloc>().add(FetchProductDetail(product.productId!));
                        });
                      },
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Delete button
                  SizedBox(
                    width: 130,
                    child: CustomFilledButton(
                      text: 'Delete',
                      fillColor: AppColor.red,
                      onTap: () {
                        // Show delete confirmation dialog
                        _showDeleteConfirmationDialog(context, product);
                      },
                    ),
                  ),
                ],

                // Show Add to Cart button only if user is NOT the owner
                if (!isOwner)
                  SizedBox(
                    width: 270,
                    child: CustomFilledButton(
                      text: isInCart ? 'В корзине' : 'Добавить в корзину',
                      onTap: () {
                        if (!isInCart) {
                          // // Add to cart with default size of 1
                          context.read<CartBloc>().add(AddToCart(product.productId!, 1));

                          // // Show success message
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(
                          //     content: Text('${product.name} доба'),
                          //     duration: const Duration(seconds: 2),
                          //     action: SnackBarAction(
                          //       label: 'View Cart',
                          //       onPressed: () {
                          //         context.router.navigate(const CartTab());
                          //       },
                          //     ),
                          //   ),
                          // );
                        } else {
                          // Navigate to cart screen if product is already in cart
                          context.router.navigate(const CartTab());
                        }
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, ProductDTO product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Product'),
        content: Text('Are you sure you want to delete ${product.name}?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<ProductDetailBloc>().add(UpdateProductDetail(
                    product.productId!,
                    product.copyWith(name: "${product.name} (deleted)"),
                  ));
              // Navigate back to the product list screen
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
