import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/api/api_error_model.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repositories/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  late bool isLoading;
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    isLoading = true;
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(apiErrorModel: failure));
      },
      (books) {
        emit(FeaturedBooksSuccess(books: books.cast<BookModel>()));
        isLoading = false;
      },
    );
  }
}
