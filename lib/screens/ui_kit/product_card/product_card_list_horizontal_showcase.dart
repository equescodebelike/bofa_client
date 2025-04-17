import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../data/dto/product_dto.dart';
import '../../../theme/app_typography.dart';
import '../../../theme/color_const.dart';

class ProductCardListHorizontalShowcase extends StatelessWidget {
  const ProductCardListHorizontalShowcase({
    super.key,
    required this.products,
    required this.category,
  });

  final List<ProductDTO> products;
  final String category;

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? const SizedBox.shrink()
        : Column(
            children: [
              Text(
                category,
                style: AppTypography.label.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 260,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: products.map((product) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to product detail screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                appBar: AppBar(
                                  title: Text(product.name),
                                ),
                                body: Center(
                                  child: Text('Product Detail: ${product.name}'),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 164,
                                  height: 192,
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
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      CachedNetworkImage(
                                        height: 192,
                                        width: 164,
                                        fit: BoxFit.cover,
                                        imageUrl: product.imageUrl ?? '',
                                        progressIndicatorBuilder: (_, __, ___) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                        errorWidget: (_, __, ___) {
                                          return Image.asset(
                                            'assets/image/empty_photo.png',
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                              ),
                              child: Text(
                                product.name,
                                style: AppTypography.label,
                              ),
                            ),
                            Text(
                              '${product.cost} / ${product.units}',
                              style: AppTypography.label,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
  }
}
