import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../data/dto/product_dto.dart';
import '../../../theme/app_typography.dart';

class ProductGridItem extends StatelessWidget {
  final ProductDTO product;
  final VoidCallback? onTap;

  const ProductGridItem({
    Key? key,
    required this.product,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    offset: const Offset(0, 4),
                    blurRadius: 12,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl ?? '',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/image/empty_photo.png',
                    fit: BoxFit.cover,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            style: AppTypography.personalCardTitle.copyWith(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            '${product.cost} / ${product.units}',
            style: AppTypography.personalCardTitle.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
