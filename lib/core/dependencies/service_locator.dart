import 'package:bookly_app/core/api/dio_consumer.dart';
import 'package:bookly_app/features/home/data/repositories/home_repo.dart';
import 'package:bookly_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer());
  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(getIt<DioConsumer>()),
  );
}
