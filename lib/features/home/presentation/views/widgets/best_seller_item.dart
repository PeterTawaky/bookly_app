import 'package:bookly_app/core/config/app_assets.dart';
import 'package:bookly_app/core/config/app_fonts.dart';
import 'package:bookly_app/core/config/app_strings.dart';
import 'package:bookly_app/core/router/app_routes.dart';
import 'package:bookly_app/core/theme/app_text_styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.bookDetailsView);
      },
      child: SizedBox(
        height: 125.h,
        child: Row(
          children: [
            CustomBookImage(aspectRatio: 1.3 / 2),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    AppStrings.dummy,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.textStyle20.copyWith(
                      fontFamily: AppFonts.gtSectra,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text('peter Tawaky'),
                  SizedBox(height: 3.h),

                  BookRating(),
                ],
              ),
            ),
            SizedBox(width: 20.w),
          ],
        ),
      ),
    );
  }
}
