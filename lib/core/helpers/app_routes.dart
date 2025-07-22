import 'package:bookly/feature/auth/presentations/views/email_verification_view.dart';
import 'package:bookly/feature/auth/presentations/views/login_and_register_view.dart';
import 'package:bookly/feature/auth/presentations/views/reset_password_view.dart';
import 'package:bookly/core/data/models/book_model/item.dart';
import 'package:bookly/feature/books_details/presentation/views/books_details_view.dart';
import 'package:bookly/feature/home/presentation/view/home_view.dart';
import 'package:bookly/feature/splash/views/splash_view.dart';
import 'package:bookly/feature/splash/views/splash_page_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String splash = '/SplashView';
  static const String splashPageView = '/SplashPageView';
  static const String loginAndRegister = '/LoginAndRegisterView';
  static const String emailVerify = '/EmailVerificationView';
  static const String reset = '/ResetPasswordView';
  static const String home = '/HomeView';
  static const String booksDetails = '/BooksDetailsView';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashView()),
      GoRoute(
        path: splashPageView,
        builder: (context, state) => SplashPageView(),
      ),
      GoRoute(
        path: loginAndRegister,
        builder: (context, state) => LoginAndRegisterView(),
      ),

      GoRoute(
        path: emailVerify,
        builder: (context, state) => EmailVerificationView(),
      ),
      GoRoute(path: reset, builder: (context, state) => ResetPasswordView()),
      GoRoute(path: home, builder: (context, state) => HomeView()),
      GoRoute(
        path: booksDetails,
        builder:
            (context, state) => BooksDetailsView(item: state.extra as Item),
      ),
    ],
  );
}
