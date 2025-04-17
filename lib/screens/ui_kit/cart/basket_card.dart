// import 'package:berrielocal/data/repository/cart_repository.dart';
// import 'package:berrielocal/data/repository/product_repository.dart';
// import 'package:berrielocal/domain/cart/order_part_main_info.dart';
// import 'package:berrielocal/domain/product/product_response.dart';
// import 'package:berrielocal/extensions/money_extension.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:decimal/decimal.dart';
// import 'package:flutter/material.dart';

// class BasketCard extends StatelessWidget {
//   const BasketCard({
//     Key? key,
//     required this.cartProduct,
//     required this.onTap,
//     required this.repository,
//     required this.size,
//     required this.cartRepository,
//   }) : super(key: key);

//   final OrderPartMainInfo cartProduct;
//   final VoidCallback onTap;
//   final ProductRepository repository;
//   final CartRepository cartRepository;
//   final int size;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return FutureBuilder(
//         future: repository.getProductById(cartProduct.productId!),
//         builder:
//             (BuildContext context, AsyncSnapshot<ProductResponse> snapshot) {
//           if (snapshot.hasData) {
//             final product = snapshot.data!;
//             final minSize = product.minSize ?? 1;
//             final maxSize = product.maxSize ?? 1;

//             return ListTile(
//               onTap: onTap,
//               leading: AspectRatio(
//                 aspectRatio: 1.0,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: CachedNetworkImage(
//                     fit: BoxFit.fill,
//                     imageUrl: product.imageUrl ?? '',
//                     progressIndicatorBuilder: (_, __, ___) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     },
//                     errorWidget: (_, __, ___) {
//                       return Image.asset(
//                         'assets/image/empty_photo.png',
//                         fit: BoxFit.fill,
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               title: Text(
//                 product.name ?? 'Продукт',
//                 style: theme.textTheme.bodyLarge?.copyWith(
//                   color: theme.colorScheme.onBackground,
//                 ),
//               ),
//               subtitle: RichText(
//                 text: TextSpan(
//                   text: Decimal.parse(
//                     product.cost.toString(),
//                   ).formatMoney(),
//                   style: theme.textTheme.bodyMedium?.copyWith(
//                     color: theme.colorScheme.onBackground,
//                   ),
//                 ),
//               ),
//               trailing: SizedBox(
//                 width: 150,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: IconButton(
//                         onPressed: size > minSize
//                             ? () async {
//                                 await cartRepository.incCount(
//                                     cartProduct.productId!, size - 1);
//                                 await cartRepository.getCart();
//                               }
//                             : () {},
//                         icon: const Icon(
//                           Icons.remove,
//                         ),
//                       ),
//                     ),
//                     Text(
//                       '$size',
//                       style: Theme.of(context).textTheme.bodyMedium,
//                     ),
//                     Expanded(
//                       child: IconButton(
//                         onPressed: size < maxSize
//                             ? () async {
//                                 await cartRepository.incCount(
//                                     cartProduct.productId!, size + 1);
//                                 await cartRepository.getCart();
//                               }
//                             : () {},
//                         icon: const Icon(Icons.add),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//           return SizedBox.shrink();
//         });
//   }
// }
