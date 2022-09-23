import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../styles/app_colors.dart';

class MyCachedNetworkImage extends StatelessWidget {
  const MyCachedNetworkImage({
    Key? key,
    required this.url,
    required this.height,
    required this.width,
    this.borderRadius = 0.0,
    this.color = AppColors.pink,
    this.fit = BoxFit.cover,
  }) : super(key: key);
  final String url;
  final double height;
  final double width;
  final double borderRadius;
  final Color color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        imageBuilder: (context, imageProvider) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        ),
        errorWidget: (context, url, error) {
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              image: DecorationImage(
                image: NetworkImage(
                  url,
                ),
                fit: fit,
              ),
            ),
          );
        },
        placeholder: (context, url) {
          return Shimmer(
            gradient: LinearGradient(colors: [
              Colors.white,
              color,
            ]),
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          );
        },
      ),
    );
  }
}
