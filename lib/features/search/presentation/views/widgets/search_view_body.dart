import 'package:bookly_app/core/theme/app_text_styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CustomSearchTextField()),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          SliverToBoxAdapter(
            child: Text('Search Result', style: AppTextStyles.textStyle20),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          Expanded(child: BestSellerListView()),
        ],
      ),
    );
  }
}
