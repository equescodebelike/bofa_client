
import 'package:bofa_client/theme/base_const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'default_shimmer.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({
    super.key,
    required this.url,
    this.width = 100,
    this.height = 100,
    this.borderRadius = baseRadius,
  });

  final String url;
  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(baseRadius),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: url,
          progressIndicatorBuilder: (_, __, ___) =>
              DefaultShimmer(
                width: double.infinity,
                height: double.infinity,
                borderRadius: borderRadius,
              ),
          errorWidget: (_, __, ___) =>
              Image.asset('assets/image/empty_photo.png')
          ,
        ),
      ),
    );
  }
}