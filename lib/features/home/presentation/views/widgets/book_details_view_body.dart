import 'package:bookly_app/core/config/app_fonts.dart';
import 'package:bookly_app/core/theme/app_text_styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/box_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_box_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/sections/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/sections/similar_box_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          //allow you to apply expanded in your widget
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                const BookDetailsCustomAppBar(),
                const BookDetailsSection(),
                const BoxAction(),

                const Expanded(child: SizedBox()),
                SimilarBoxSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
