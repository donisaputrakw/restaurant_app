import 'package:flutter/material.dart';
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
        baseColor: baseColor ?? Theme.of(context).dividerColor.withOpacity(0.2),
        highlightColor: highlightColor ?? Theme.of(context).dividerColor,
        period: const Duration(seconds: 3),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(radius ?? 4),
          ),
        ));
  }
}
