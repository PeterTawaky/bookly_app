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
  Future<Either<ApiErrorModel, List<dynamic>>> fetchNewstBooks() async {
    try {
      var data = await dioConsumer.get(
        ApiConstants.googleBooks.endpoints.volumes,
        queryParameters: {
          'q': 'robots',
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
  Future<Either<ApiErrorModel, List<dynamic>>> fetchFeaturedBooks() async {
    try {
      var data = await dioConsumer.get(
        ApiConstants.googleBooks.endpoints.volumes,
        queryParameters: {'q': 'AI', 'Filtering': 'free-'},
      );
      return Right(data['items'].map((e) => BookModel.fromJson(e)).toList());
    } on Exception catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, List<dynamic>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await dioConsumer.get(
        ApiConstants.googleBooks.endpoints.volumes,
        queryParameters: {'q': category, 'Filtering': 'free-'},
      );
      return Right(data['items'].map((e) => BookModel.fromJson(e)).toList());
    } on Exception catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
