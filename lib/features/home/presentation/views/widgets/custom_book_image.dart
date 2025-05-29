import 'package:bookly_app/core/config/app_assets.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  final double aspectRatio;
  const CustomBookImage({super.key, required this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          image: DecorationImage(
            image: AssetImage(Assets.imagesTestImage),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
