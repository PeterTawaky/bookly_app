import 'package:bookly_app/core/config/app_fonts.dart';
import 'package:bookly_app/core/theme/app_text_styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 50.w),
          child: CustomBookImage(aspectRatio: 1.3 / 2),
        ),
        SizedBox(height: 30.h),
        Text(
          'The Jungle Book',
          style: AppTextStyles.textStyle30.copyWith(
            fontFamily: AppFonts.gtSectra,
          ),
        ),
        SizedBox(height: 5.h),
        Opacity(
          opacity: 0.7,
          child: Text(
            'peter tawaky',
            style: AppTextStyles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(width: 180.w, child: BookRating()),
      ],
    );
  }
}
