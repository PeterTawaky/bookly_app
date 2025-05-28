import 'package:bookly_app/core/utils/app_assets.dart';
import 'package:bookly_app/core/utils/app_fonts.dart';
import 'package:bookly_app/core/utils/app_strings.dart';
import 'package:bookly_app/core/utils/app_text_styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 125.h,
      child: Row(
        children: [
          CustomListViewItem(aspectRatio: 1.3 / 2),
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
                Row(
                  children: [
                    Text('19.99€', style: AppTextStyles.textStyle20),
                    Spacer(),
                    Icon(
                      FontAwesomeIcons.solidStar,
                      color: Colors.yellow.shade700,
                      size: 20.sp,
                    ),
                    SizedBox(width: 5.w),
                    Text('4.6', style: AppTextStyles.textStyle18),
                    SizedBox(width: 5.w),
                    Text(
                      '(2390)',
                      style: AppTextStyles.textStyle16.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 20.w),
        ],
      ),
    );
  }
}
