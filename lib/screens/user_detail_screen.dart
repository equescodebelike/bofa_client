import 'package:bofa_client/data/dto/product_list_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/user_detail/user_detail_barrel.dart';
import '../data/dto/user_dto.dart';
import '../data/dto/product_dto.dart';
import '../data/service/product_service.dart';
import '../data/repository/product_repository.dart';
import '../theme/app_typography.dart';
import '../theme/color_const.dart';
import '../screens/ui_kit/custom_filled_button.dart';
import '../screens/ui_kit/product_card/categories_list.dart';
import '../screens/ui_kit/product_card/product_grid_view.dart';
import 'user_form_screen.dart';

@RoutePage()
class UserDetailScreen extends StatelessWidget {
  final int userId;

  const UserDetailScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    // Fetch the user details when the screen is built
    context.read<UserDetailBloc>().add(FetchUserDetail(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Details',
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
      body: BlocBuilder<UserDetailBloc, UserDetailState>(
        builder: (context, state) {
          if (state is UserDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserDetailLoaded) {
            return _buildUserDetails(context, state.user);
          } else if (state is UserDetailError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(
              child: Text('User not found'),
            );
          }
        },
      ),
    );
  }

  Widget _buildUserDetails(BuildContext context, UserDTO user) {
    // Get product service
    final productRepository = RepositoryProvider.of<ProductRepository>(context);
    final productService = ProductService(productRepository);
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                // User image and description in a row
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 128,
                        height: 128,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.black.withOpacity(0.08),
                              offset: const Offset(0, 4),
                              blurRadius: 12,
                              spreadRadius: 0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: user.imageUrl ?? '',
                              progressIndicatorBuilder: (_, __, ___) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              errorWidget: (_, __, ___) {
                                return Container(
                                  color: Colors.grey[200],
                                  child: const Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                            // Add a badge in the top right corner
                            Positioned(
                              right: 10,
                              top: 8,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColor.green,
                                ),
                                height: 24,
                                width: 67,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      user.categories.length.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    SvgPicture.asset(
                                      'assets/svg/info.svg',
                                      height: 18,
                                      width: 18,
                                      color: AppColor.white,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // User description
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: AppTypography.personalCardTitle,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.email, color: Colors.grey, size: 16),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    user.email,
                                    style: AppTypography.label,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.phone, color: Colors.grey, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  user.phoneNumber,
                                  style: AppTypography.label,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                
                // Rating and reviews
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      _buildRatingStars(3.5), // Placeholder rating
                      const SizedBox(width: 10),
                      const Text('3.5'),
                      const Spacer(),
                      Text(
                        '${user.categories.length} categories >',
                        style: AppTypography.personalCardTitle,
                      ),
                    ],
                  ),
                ),
                
                // Categories
                CategoriesList(list: user.categories),
                
                // User's Products
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: FutureBuilder<ProductListDto>(
                    future: productService.getProductByUserId(user.userId!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('No products found for this user'),
                        );
                      } else {
                        
                        // Display products grouped by category
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'User Products',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: snapshot.data!.products != null 
                                  ? snapshot.data!.products!.entries.map((entry) {
                                      final category = entry.key;
                                      final productsList = entry.value;
                                      
                                      if (productsList == null) {
                                        return const SizedBox.shrink();
                                      }
                                      
                                      return ProductGridView(
                                        products: productsList,
                                        category: category,
                                      );
                                    }).toList()
                                  : [const Text('No products available')],
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
                
                // Action button
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 16),
                  child: CustomFilledButton(
                    text: 'Edit User',
                    onTap: () {
                      // Navigate to edit user screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserFormScreen(
                            user: user,
                          ),
                        ),
                      ).then((_) {
                        // Refresh user details when returning from form
                        context.read<UserDetailBloc>().add(FetchUserDetail(user.userId!));
                      });
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
  
  Widget _buildRatingStars(double rating) {
    final List<Widget> stars = [];
    final int activeStarsCount = rating.floor();
    final bool hasHalfStar = rating - activeStarsCount >= 0.5;

    for (int i = 0; i < activeStarsCount; i++) {
      stars.add(
        Padding(
          padding: const EdgeInsets.only(right: 2),
          child: SvgPicture.asset(
            'assets/svg/star.svg',
            height: 16,
            width: 16,
          ),
        ),
      );
    }

    if (hasHalfStar) {
      stars.add(
        Padding(
          padding: const EdgeInsets.only(right: 2),
          child: SvgPicture.asset(
            'assets/svg/star.svg',
            height: 16,
            width: 16,
            color: Colors.amber,
          ),
        ),
      );
    }

    for (int i = 0; i < 5 - activeStarsCount - (hasHalfStar ? 1 : 0); i++) {
      stars.add(
        Padding(
          padding: const EdgeInsets.only(right: 2),
          child: SvgPicture.asset(
            'assets/svg/star.svg',
            height: 16,
            width: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    return Row(children: stars);
  }
}
