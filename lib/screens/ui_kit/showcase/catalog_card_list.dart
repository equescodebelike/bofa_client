// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';

// class CatalogCardList extends StatelessWidget {
//   const CatalogCardList({
//     super.key,
//     required this.list,
//     required this.category,
//   });

//   final List<ShopMainInfo> list;
//   final String category;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 8),
//           child: Text(
//             category.translateEnRu(),
//             style: AppTypography.label.copyWith(fontSize: 16),
//           ),
//         ),
//         SizedBox(
//           height: 150,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: list.map((e) {
//               return Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: GestureDetector(
//                   onTap: () {
//                     context.router
//                         .navigate(ShopRoute(shopId: int.parse(e.shopId!)));
//                   },
//                   child: CatalogCard(shop: e),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }
