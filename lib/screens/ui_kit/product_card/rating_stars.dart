import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildRatingStars(double rating) {
  final List<Widget> stars = [];
  final int activeStarsCount = rating.floor();

  for (int i = 0; i < activeStarsCount; i++) {
    stars.add(
      SvgPicture.asset(
        'assets/svg/star.svg',
      ),
    );
  }

  for (int i = 0; i < 5 - activeStarsCount; i++) {
    stars.add(
      SvgPicture.asset(
        'assets/svg/star.svg',
        color: Colors.grey,
      ),
    );
  }

  return Row(children: stars);
}
