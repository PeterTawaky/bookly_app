import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingIndicatorShimmer extends StatelessWidget {
  final double aspectRatio;

  const LoadingIndicatorShimmer({super.key, required this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        child: Container(
          // width: ,
          // height: ,
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
