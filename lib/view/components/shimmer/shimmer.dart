import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCustom extends StatelessWidget {
  Widget child;

  ShimmerCustom({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: child,
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[300]!,
    );
  }
}
