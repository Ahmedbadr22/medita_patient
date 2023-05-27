import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius = 0.0,
  });

  final double height;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [
          Colors.grey[600]!,
          Colors.grey[500]!,
          Colors.grey[400]!,
          Colors.grey[300]!,
          Colors.grey[200]!,
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        width: width,
        height: height,
      ),
    );
  }

}