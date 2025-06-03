import 'package:bookly_app/core/api/dio_consumer.dart';
import 'package:bookly_app/core/dependencies/service_locator.dart';
import 'package:bookly_app/core/router/app_routes.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouterGenerator {
  static GoRouter mainRouting = GoRouter(
    initialLocation: AppRoutes.splashView,
    //  errorBuilder: (context, state) {
    //    return Scaffold(
    //      body: Center(
    //        child: Text('No Router for this app'),
    //      ),
    //    );
    //  },
    routes: [
      GoRoute(
        name: AppRoutes.splashView,
        path: AppRoutes.splashView,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        name: AppRoutes.homeView,
        path: AppRoutes.homeView,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create:
                      (context) =>
                          FeaturedBooksCubit(getIt<HomeRepoImpl>())
                            ..fetchFeaturedBooks(),
                ),
                BlocProvider(
                  create:
                      (context) =>
                          NewestBooksCubit(getIt<HomeRepoImpl>())
                            ..fetchNewstBooks(),
                ),
              ],
              child: HomeView(),
            ),
      ),
      GoRoute(
        name: AppRoutes.bookDetailsView,
        path: AppRoutes.bookDetailsView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => SimilarBooksCubit(getIt<HomeRepoImpl>())
                    ..fetchSimilarBooks(bookModel: state.extra as BookModel),
              child: BookDetailsView(bookModel: state.extra as BookModel),
            ),
      ),
      GoRoute(
        name: AppRoutes.searchView,
        path: AppRoutes.searchView,
        builder: (context, state) => SearchView(),
      ),
    ],
  );
}
