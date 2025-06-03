import 'package:bookly_app/core/api/api_error_model.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ApiErrorModel, List<dynamic>>> fetchNewstBooks();
  Future<Either<ApiErrorModel, List<dynamic>>> fetchFeaturedBooks();
  Future<Either<ApiErrorModel, List<dynamic>>> fetchSimilarBooks({
    required String category,
  });
}
