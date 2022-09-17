import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  final Color? baseColor;
  final Color? highlightColor;
  final double? width;
  final double? height;
  final double? radius;
  const Skeleton({
    Key? key,
    this.baseColor,
    this.highlightColor,
    this.width,
    this.height,
    this.radius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: baseColor ?? Colors.grey[300]!,
        highlightColor: highlightColor ?? Colors.grey[100]!,
        period: const Duration(seconds: 3),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(.3),
            borderRadius: BorderRadius.circular(radius ?? 4),
          ),
        ));
  }
}
