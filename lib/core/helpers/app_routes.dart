import 'package:bookly/feature/view/home/views/books_details.dart';
import 'package:bookly/feature/view/home/views/home_view.dart';
import 'package:bookly/feature/view/home/views/search_view.dart';
import 'package:bookly/feature/view/splash/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String splash = '/SplashView';
  static const String home = '/HomeView';
  static const String booksDetails = '/BooksDetails';
  static const String search = '/SearchView';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashView()),
      GoRoute(path: home, builder: (context, state) => HomeView()),
      GoRoute(path: booksDetails, builder: (context, state) => BooksDetails()),
      GoRoute(path: search, builder: (context, state) => SearchView()),
    ],
  );
}
