import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final Widget child;

  const ShimmerLoading({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: child,
    );
  }
}

class ShimmerBlock extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerBlock({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class ShimmerCircle extends StatelessWidget {
  final double radius;

  const ShimmerCircle({
    super.key,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class ShimmerTextLine extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerTextLine({
    super.key,
    required this.width,
    this.height = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ShimmerBlock(
        width: width,
        height: height,
        borderRadius: 4.0,
      ),
    );
  }
}
