import 'package:bookly/feature/view/home/views/home_view.dart';
import 'package:bookly/feature/view/splash/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String splash = '/SplashView';
  static const String home = '/HomeView';
  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashView()),
      GoRoute(path: home, builder: (context, state) => HomeView()),
    ],
  );
}
