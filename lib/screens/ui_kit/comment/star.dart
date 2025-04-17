import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Star extends StatelessWidget {
  final bool filled;
  final double size;
  final VoidCallback onTap;

  const Star({
    Key? key,
    required this.filled,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: filled
          ? SvgPicture.asset(
              'assets/svg/star.svg',
              width: size,
              height: size,
            )
          : SvgPicture.asset(
              'assets/svg/star.svg',
              color: Colors.grey,
              width: size,
              height: size,
            ),
    );
  }
}
