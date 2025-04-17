// import 'package:intl/intl.dart';
// import 'package:berrielocal/domain/cart/order_part_main_info.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class OrderHistoryCard extends StatelessWidget {
//   const OrderHistoryCard({
//     super.key,
//     required this.order,
//   });

//   final OrderPartMainInfo order;

//   @override
//   Widget build(BuildContext context) {
//     final DateFormat dateFormat = DateFormat('dd MMMM yyyy', 'ru');
//     final String formattedDate =
//         dateFormat.format(order.orderedAt ?? DateTime.now());

//     String translateStatus(String status) {
//       switch (status) {
//         case 'IN_CART':
//           return 'В пути';
//         case 'ORDERED':
//           return 'В пути';
//         case 'DELIVERED':
//           return 'Доставлен';
//         case 'CANCELLED':
//           return 'Отменен';
//         default:
//           return status;
//       }
//     }

//     return SizedBox(
//       height: 117,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 24),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('№${order.productId}'),
//                 const Icon(
//                   Icons.arrow_forward_ios,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 16),
//             child: Row(
//               children: [Text('от $formattedDate')],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text('Статус заказа'),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 4),
//                   child: Text(translateStatus(order.status)),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
