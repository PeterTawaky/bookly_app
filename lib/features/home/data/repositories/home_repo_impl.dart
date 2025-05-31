import 'package:bookly_app/core/api/api_constants.dart';
import 'package:bookly_app/core/api/api_error_handler.dart';
import 'package:bookly_app/core/api/dio_consumer.dart';
import 'package:bookly_app/core/api/api_error_model.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final DioConsumer dioConsumer;
  HomeRepoImpl(this.dioConsumer);
  @override
  Future<Either<ApiErrorModel, List<BookModel>>> fetchNewstBooks() async {
    try {
      var data = await dioConsumer.get(
        ApiConstants.googleBooks.endpoints.volumes,
        queryParameters: {
          'q': 'subject:computers',
          'Filtering': 'free-',
          'Sorting': 'newest',
        },
      );
      return Right(data['items'].map((e) => BookModel.fromJson(e)).toList());
    } on Exception catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await dioConsumer.get(
        ApiConstants.googleBooks.endpoints.volumes,
        queryParameters: {'q': 'subject:computers', 'Filtering': 'free-'},
      );
      return Right(data['items'].map((e) => BookModel.fromJson(e)).toList());
    } on Exception catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
