import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/api/api_error_model.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repositories/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  late bool isLoading;

  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  HomeRepo homeRepo;

  Future<void> fetchNewstBooks() async {
    isLoading = true;
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewstBooks();
    result.fold(
      (failure) {
        emit(NewestBooksFailure(apiErrorModel: failure));
      },
      (books) {
        emit(NewestBooksSuccess(books: books.cast<BookModel>()));
        isLoading = false;
      },
    );
  }
}
