
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CatalogCard extends StatelessWidget {
//   const CatalogCard({
//     super.key,
//     required this.shop,
//   });

//   final ShopMainInfo shop;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: 200,
//           height: 109,
//           clipBehavior: Clip.hardEdge,
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: AppColor.black.withOpacity(0.08),
//                 offset: const Offset(0, 4),
//                 blurRadius: 12,
//                 spreadRadius: 0,
//               )
//             ],
//             borderRadius: BorderRadius.circular(15),
//             color: Colors.white,
//           ),
//           child: CachedNetworkImage(
//             fit: BoxFit.cover,
//             imageUrl: shop.imageUrl ?? '',
//             progressIndicatorBuilder: (_, __, ___) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             },
//             errorWidget: (_, __, ___) {
//               return Image.asset(
//                 'assets/image/empty_photo.png',
//                 fit: BoxFit.cover,
//               );
//             },
//           ),
//         ),
//         SizedBox(
//           width: 200,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: 140,
//                 child: Text(shop.name!),
//               ),
//               Spacer(),
//               SvgPicture.asset('assets/svg/star.svg'),
//               Text(shop.matchLevel.toString() ?? '0.0')
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
