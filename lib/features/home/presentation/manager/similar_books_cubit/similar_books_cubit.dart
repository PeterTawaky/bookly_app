import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/api/api_error_model.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repositories/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  HomeRepo homeRepo;
  bool isLoading = false;
  Future<void> fetchSimilarBooks({required BookModel bookModel}) async {
    isLoading = true;
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(
      category: bookModel.volumeInfo!.categories!.first,
    );
    result.fold(
      (failure) {
        emit(SimilarBooksFailure(apiErrorModel: failure));
      },
      (books) {
        emit(SimilarBooksSuccess(books: books.cast<BookModel>()));
        isLoading = false;
      },
    );
  }
}
