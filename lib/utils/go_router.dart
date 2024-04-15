import 'package:go_router/go_router.dart';
import 'package:movies_app/features/ui/details_screen.dart';
import 'package:movies_app/features/ui/home_screen.dart';
import 'package:movies_app/features/ui/series_details_screen.dart';
import 'package:movies_app/features/ui/splash_screen.dart';
import 'package:movies_app/features/ui/top_details_screen.dart';
import 'package:movies_app/models/top_rated_model/top_rated_model.dart';
import 'package:movies_app/models/tv_model/tv_model.dart';
import 'package:movies_app/models/upcoming_model/upcoming_model.dart';

abstract class AppRouter {
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/HomeScreen',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/DetailsScreen',
        builder: (context, state) => DetailsScreen(
          upcomingModel: state.extra as UpcomingModel,
        ),
      ),
      GoRoute(
        path: '/TopDetailsScreen',
        builder: (context, state) => TopDetailsScreen(
          topRatedModel: state.extra as TopRatedModel,
        ),
      ),
      GoRoute(
        path: '/SeriesDetailsScreen',
        builder: (context, state) => SeriesDetailsScreen(
          tvModel: state.extra as TvModel,
        ),
      )
    ],
  );
}
