import 'package:bookly_app/core/config/app_fonts.dart';
import 'package:bookly_app/core/theme/app_text_styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsSection extends StatelessWidget {
  final BookModel bookModel;
  const BookDetailsSection({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 50.w),
          child: CustomBookImage(bookModel: bookModel, aspectRatio: 1.3 / 2),
        ),
        SizedBox(height: 30.h),
        Text(
          bookModel.volumeInfo!.title!,
          textAlign: TextAlign.center,
          style: AppTextStyles.textStyle30.copyWith(
            fontFamily: AppFonts.gtSectra,
          ),
        ),
        SizedBox(height: 5.h),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo!.authors == null? '' :
            bookModel.volumeInfo!.authors!.first,
            style: AppTextStyles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        // SizedBox(width: 180.w, child: BookRating()),
      ],
    );
  }
}
