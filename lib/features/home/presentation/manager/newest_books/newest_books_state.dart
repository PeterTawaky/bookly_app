part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> books;
  const NewestBooksSuccess({required this.books});
}

final class NewestBooksFailure extends NewestBooksState {
  final ApiErrorModel apiErrorModel;
  const NewestBooksFailure({required this.apiErrorModel});
}

final class NewestBooksLoading extends NewestBooksState {}
