import 'package:bookly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
          style: AppTextStyles.textStyle16.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
