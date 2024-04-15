import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constans.dart';
import 'package:movies_app/manager/cubit/series_cubit.dart';
import 'package:movies_app/manager/cubit/top_rated_cubit.dart';
import 'package:movies_app/manager/cubit/upcoming_cubit.dart';
import 'package:movies_app/providers/myProvider.dart';
import 'package:movies_app/repos/HomeRepoImp.dart';
import 'package:movies_app/services/api_service.dart';
import 'package:movies_app/utils/go_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<myProvider>(
      create: (context) => myProvider(),
      child: const MoviesApp(),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProvider>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpcomingCubit(
            HomeReposImp(
              ApiService(),
            ),
          )..upcomingMovies(),
        ),
        BlocProvider(
          create: (context) => TopRatedCubit(
            HomeReposImp(
              ApiService(),
            ),
          )..TopRatedMovies(),
        ),
        BlocProvider(
          create: (context) => SeriesCubit(
            HomeReposImp(
              ApiService(),
            ),
          )..seriesCubit(),
        ),
      ],
      child: MaterialApp.router(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: Locale(provider.lang),
        supportedLocales: const [Locale('en'), Locale('ar')],
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.routes,
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: Apptheme.myPrimaryColor),
      ),
    );
  }
}
