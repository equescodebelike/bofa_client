// import 'package:decimal/decimal.dart';
// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// class ProductGridItem extends StatelessWidget {
//   final ProductResponse product;

//   const ProductGridItem({
//     Key? key,
//     required this.product,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         AspectRatio(
//           aspectRatio: 1,
//           child: CachedNetworkImage(
//             imageUrl: product.imageUrl ?? '',
//             placeholder: (context, url) => const Center(
//               child: CircularProgressIndicator(),
//             ),
//             errorWidget: (context, url, error) => Image.asset(
//               'assets/image/empty_photo.png',
//               fit: BoxFit.contain,
//             ),
//             fit: BoxFit.contain,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           product.name ?? 'Название товара',
//           style: AppTypography.personalCardTitle.copyWith(fontSize: 14),
//           maxLines: 2,
//           overflow: TextOverflow.ellipsis,
//         ),
//         const SizedBox(height: 4),
//         Text(
//           '${Decimal.parse(product.cost.toString()).formatMoney() ?? '0'}',
//           style: AppTypography.personalCardTitle.copyWith(fontSize: 14),
//         ),
//       ],
//     );
//   }
// }
