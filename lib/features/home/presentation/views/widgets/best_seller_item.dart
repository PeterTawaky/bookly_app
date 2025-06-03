import 'package:bookly_app/core/config/app_fonts.dart';
import 'package:bookly_app/core/router/app_routes.dart';
import 'package:bookly_app/core/theme/app_text_styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  final BookModel book;
  const BestSellerItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(AppRoutes.bookDetailsView, extra: book);
        },
        child: SizedBox(
          height: 125.h,
          child: Row(
            children: [
              CustomBookImage(
                bookModel: book,
                aspectRatio: 1.3 / 2,
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 2,
                      book.volumeInfo!.title!,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.textStyle20.copyWith(
                        fontFamily: AppFonts.gtSectra,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      book.volumeInfo!.authors![0],
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 3.h),

                    BookRating(
                      count: book.volumeInfo!.pageCount!,
                      rating: HelperFunctions.getRandomDoubleNumber(5),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
        ),
      ),
    );
  }
}
