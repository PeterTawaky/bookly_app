import 'package:bookly_app/core/config/app_assets.dart';
import 'package:bookly_app/core/router/app_routes.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomBookImage extends StatelessWidget {
  final BookModel bookModel;
  final double aspectRatio;
  const CustomBookImage({
    super.key,
    required this.aspectRatio,
    required this.bookModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 12.w),
      child: GestureDetector(
        onTap:
            () =>
                context.pushNamed(AppRoutes.bookDetailsView, extra: bookModel),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.sp),
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => Icon(Icons.error),
              placeholder:
                  (context, url) => Center(child: CircularProgressIndicator()),
              fit: BoxFit.fill,
              imageUrl:
                  bookModel.volumeInfo!.imageLinks == null
                      ? Assets.imagesNoImage
                      : bookModel.volumeInfo!.imageLinks!.thumbnail! ??
                          Assets.imagesNoImage,
            ),
          ),
        ),
      ),
    );
  }
}
