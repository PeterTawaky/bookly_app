import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/loading_indicator_shimmer.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBoxListView extends StatelessWidget {
  final double listHeight;
  const FeaturedBoxListView({super.key, required this.listHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight,
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksFailure) {
            return CustomErrorWidget(errorMessage: state.apiErrorModel.message);
          } else if (state is FeaturedBooksSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder:
                  (context, index) => CustomBookImage(
                    bookModel: state.books[index],
                    aspectRatio: 1.2 / 2,
                  ),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder:
                  (context, index) =>
                      LoadingIndicatorShimmer(aspectRatio: 1.2 / 2),
            );
          }
        },
      ),
    );
  }
}
