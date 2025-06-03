import 'package:bookly_app/core/config/app_strings.dart';
import 'package:bookly_app/core/theme/app_text_styles.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_box_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 3));
          BlocProvider.of<NewestBooksCubit>(context).fetchNewstBooks();
          BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomAppBar(),
                  FeaturedBoxListView(listHeight: 220.h),

                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.bestSeller,
                      style: AppTextStyles.textStyle20.copyWith(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            const BestSellerListView(),
          ],
        ),
      ),
    );
  }
}
