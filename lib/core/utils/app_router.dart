import 'package:booklyapp/Features/Search/presentation/Views/searchpage.dart';
import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/data/repos/home_repoImpl.dart';
import 'package:booklyapp/Features/home/presentation/Views/detailespage.dart';
import 'package:booklyapp/Features/home/presentation/Views/homepage.dart';
import 'package:booklyapp/Features/home/presentation/mange/Searchbook/searchbook_cubit.dart';
import 'package:booklyapp/Features/home/presentation/mange/SimilerBooks/similerbook_cubit.dart';
import 'package:booklyapp/Features/splash/presentation/Views/SplashView.dart';
import 'package:booklyapp/core/utils/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const khomepage = '/detailespage';
  static const ksearchpage = '/searchpage';
  static const kdetailespage = '/homepage';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const Splashview();
        },
      ),
      GoRoute(
        path: khomepage,
        builder: (context, state) {
          return const Homepage();
        },
      ),
      GoRoute(
        path: kdetailespage,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SimilerbookCubit(getIt.get<HomeRepoImpl>()),
            child: DetailesPage(
              bookModel: state.extra as BookModel,
            ),
          );
        },
      ),
      GoRoute(
        path: ksearchpage,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SearchbookCubit(getIt.get<HomeRepoImpl>()),
            child: const Searchpage(),
          );
        },
      ),
    ],
  );
}
