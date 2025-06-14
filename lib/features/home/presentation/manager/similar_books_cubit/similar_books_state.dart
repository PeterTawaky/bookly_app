part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksFailure extends SimilarBooksState {
  final ApiErrorModel apiErrorModel;
  const SimilarBooksFailure({required this.apiErrorModel});
}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;
  const SimilarBooksSuccess({required this.books});
}
