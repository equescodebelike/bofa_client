import 'package:bofa_client/theme/base_const.dart';
import 'package:bofa_client/theme/color_const.dart';
import 'package:flutter/material.dart';

class DefaultCardContainer extends StatelessWidget {
  const DefaultCardContainer({
    super.key,
    this.child,
    this.borderRadius,
    this.height,
    this.width,
  });

  final Widget? child;
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.onSurface;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(baseRadius),
        boxShadow:  const [
          BoxShadow(offset: Offset(0, 1), blurRadius: 1, color: AppColor.black),
        ],
      ),
      child: child,
    );
  }
}
