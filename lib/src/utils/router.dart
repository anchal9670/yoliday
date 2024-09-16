import 'package:assign/src/common/views/splash.dart';
import 'package:assign/src/features/home/view/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: SplashScreen.routeName,
  routes: [
    GoRoute(
      path: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: HomePageView.routeName,
      builder: (context, state) => const HomePageView(),
    ),
  ],
);
