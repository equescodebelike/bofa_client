// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'star.dart';

// class Rating extends StatefulWidget {
//   final int maxRating;
//   final double starSize;
//   final TextEditingController controller;
//   final int shopId;
//   final CommentRepository repository;

//   const Rating({
//     Key? key,
//     this.maxRating = 5,
//     this.starSize = 40.0,
//     required this.controller,
//     required this.shopId,
//     required this.repository,
//   }) : super(key: key);

//   @override
//   _RatingState createState() => _RatingState();
// }

// class _RatingState extends State<Rating> {
//   int _currentRating = 0;

//   void _setRating(int rating) {
//     setState(() {
//       _currentRating = rating;
//     });
//   }

//   int getCurrentRating() {
//     return _currentRating;
//   }

//   final ShopRepository shopRepository = AppComponents().shopRepository;

//   Future<void> postComment(CommentCreateRequest request) async {
//     await widget.repository.postComment(request);
//     await widget.repository.getComments(widget.shopId);
//     context
//         .showSnackBar('Спасибо за отзыв! Обновите страницу, чтобы увидеть его');
//     context.router.popUntilRoot();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: List.generate(widget.maxRating, (index) {
//             return Star(
//               filled: index < _currentRating,
//               size: widget.starSize,
//               onTap: () => _setRating(index + 1),
//             );
//           }),
//         ),
//         SizedBox(
//           height: 200,
//         ),
//         CustomFilledButton(
//           text: 'СОХРАНИТЬ',
//           onTap: () => setState(() {
//             postComment(
//               CommentCreateRequest(
//                 shopId: widget.shopId,
//                 text: widget.controller.text,
//                 rate: _currentRating.toDouble(),
//               ),
//             );
//           }),
//         ),
//       ],
//     );
//   }
// }
