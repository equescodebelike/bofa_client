import 'package:auto_route/auto_route.dart';
import 'package:bofa_client/navigation/app_router.dart';
import 'package:flutter/material.dart';
import '../../../data/dto/product_dto.dart';
import '../../../theme/app_typography.dart';
import 'product_grid_item.dart';

class ProductGridView extends StatelessWidget {
  final List<ProductDTO> products;
  final String category;

  const ProductGridView({
    Key? key,
    required this.products,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            category,
            style: AppTypography.label.copyWith(fontSize: 16),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductGridItem(
              product: product,
              onTap: () {
                // Navigate to product detail screen
                context.router.push(ProductDetailRoute(productId: product.productId!));
              },
            );
          },
        ),
      ],
    );
  }
}
