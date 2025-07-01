import 'package:bookly/feature/home/views/books_details.dart';
import 'package:bookly/feature/home/views/home_view.dart';
import 'package:bookly/feature/splash/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String splash = '/SplashView';
  static const String home = '/HomeView';
  static const String booksDetails = '/BooksDetails';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashView()),
      GoRoute(path: home, builder: (context, state) => HomeView()),
      GoRoute(path: booksDetails, builder: (context, state) => BooksDetails()),
    ],
  );
}
