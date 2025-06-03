import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/box_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/sections/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/sections/similar_box_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_box_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel bookModel;
  const BookDetailsViewBody({super.key, required this.bookModel});

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
                BookDetailsSection(bookModel: bookModel),
                BoxAction(bookModel: bookModel),

                const Expanded(child: SizedBox()),
                SimilarBoxList(listHeight: 100.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
