import 'package:booklyapp/Features/home/data/repos/home_repoImpl.dart';
import 'package:booklyapp/Features/home/presentation/mange/FeaturedBooks/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/mange/newestBooks/newestbooks_cubit.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

void main() {
  Setup();
  runApp(booklyapp());
}

class booklyapp extends StatelessWidget {
  const booklyapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
              ..fetchFeaturedBook()),
        BlocProvider(
          create: (context) => NewestbooksCubit(getIt.get<HomeRepoImpl>())..fetchNewsBook(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
          scaffoldBackgroundColor: kprimarycolor,
        ),
      ),
    );
  }
}
