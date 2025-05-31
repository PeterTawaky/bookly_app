import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errorMessage: state.apiErrorModel.message),
          );
        } else {
          return SliverToBoxAdapter(
            child: Skeletonizer(
              enabled: BlocProvider.of<NewestBooksCubit>(context).isLoading,
              child: SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) => const BestSellerItem(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
