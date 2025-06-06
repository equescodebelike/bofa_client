import 'dart:ui';

import 'package:bofa_client/data/dto/product_list_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../bloc/user_detail/user_detail_barrel.dart';
import '../../data/dto/user_dto.dart';
import '../../data/service/product_service.dart';
import '../../data/repository/product_repository.dart';
import '../../theme/app_typography.dart';
import '../../theme/color_const.dart';
import '../ui_kit/product_card/categories_list.dart';
import '../ui_kit/product_card/product_grid_view.dart';
import '../../bloc/auth/auth_barrel.dart';

@RoutePage()
class UserDetailScreen extends StatefulWidget {
  final int userId;
  final String userName;

  const UserDetailScreen({
    super.key,
    required this.userId,
    required this.userName,
  });

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserDetailBloc>().add(FetchUserDetail(widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.userName,
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
                            Center(
                              child: CachedNetworkImage(
                                fit: BoxFit.contain,
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
                            ),
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
                            BlocBuilder<AuthBloc, AuthState>(
                              bloc: context.read<AuthBloc>(),
                              builder: (context, authState) {
                                if (user.phoneNumber != null) {
                                  if (authState is AuthSuccess) {
                                    return Row(
                                      children: [
                                        const Icon(Icons.phone, color: Colors.grey, size: 16),
                                        const SizedBox(width: 4),
                                        Text(
                                          user.phoneNumber!,
                                          style: AppTypography.label,
                                        ),
                                      ],
                                    );
                                  } else {
                                    return GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Text(
                                                    'Войдите, чтобы увидеть номер телефона',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        context.router.pushNamed('/auth/email');
                                                      },
                                                      child: const Text('Войти'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(Icons.phone, color: Colors.grey, size: 16),
                                          const SizedBox(width: 4),
                                          ImageFiltered(
                                            imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                            child: Text(
                                              '+79064545657',
                                              style: AppTypography.label,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                }
                                return const SizedBox.shrink();
                              },
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
                        '${user.categories?.length ?? 'Пустые'} категории',
                        style: AppTypography.personalCardTitle,
                      ),
                    ],
                  ),
                ),

                // Categories
                CategoriesList(list: user.categories ?? []),

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
                                'Товары магазина',
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
