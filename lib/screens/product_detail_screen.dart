import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import '../bloc/product_detail/product_detail_barrel.dart';
import '../data/dto/product_dto.dart';
import 'product_form_screen.dart';

@RoutePage()
class ProductDetailScreen extends StatelessWidget {
  final int productId;

  const ProductDetailScreen({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    // Fetch the product details when the screen is built
    context.read<ProductDetailBloc>().add(FetchProductDetail(productId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
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
    );
  }

  Widget _buildProductDetails(BuildContext context, ProductDTO product) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          if (product.imageUrl != null && product.imageUrl!.isNotEmpty)
            Center(
              child: Image.network(
                product.imageUrl!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            )
          else
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Icon(
                Icons.image,
                size: 50,
                color: Colors.grey,
              ),
            ),
          const SizedBox(height: 16),
          
          // Product name
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          
          // Product email
          Row(
            children: [
              const Icon(Icons.email, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                product.email,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // Product cost
          Row(
            children: [
              const Icon(Icons.attach_money, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                '\$${product.cost.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // Product units
          Row(
            children: [
              const Icon(Icons.inventory, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                'Units: ${product.units}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // Product minimum step
          Row(
            children: [
              const Icon(Icons.stairs, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                'Minimum Step: ${product.mnStep}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
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
                icon: const Icon(Icons.edit),
                label: const Text('Edit'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Show delete confirmation dialog
                  _showDeleteConfirmationDialog(context, product);
                },
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ],
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
                    product.copyWith(name: product.name + " (deleted)"),
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
