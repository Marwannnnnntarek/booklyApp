import 'package:bookly/core/services/service_locator.dart';
import 'package:bookly/feature/auth/presentations/views/email_verification_view.dart';
import 'package:bookly/feature/auth/presentations/views/login_and_register_view.dart';
import 'package:bookly/feature/auth/presentations/views/reset_password_view1.dart';
import 'package:bookly/feature/auth/presentations/views/reset_password_view2.dart';
import 'package:bookly/feature/auth/presentations/views/reset_password_view3.dart';
import 'package:bookly/feature/home/data/models/book_model/item.dart';
import 'package:bookly/feature/home/data/repos/home_repo_implementation.dart';
import 'package:bookly/feature/home/presentation/view/books_details.dart';
import 'package:bookly/feature/home/presentation/view/home_view.dart';
import 'package:bookly/feature/home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/feature/splash/views/splash_view.dart';
import 'package:bookly/feature/splash/views/splash_page_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String splash = '/SplashView';
  static const String splashPageView = '/SplashPageView';
  static const String loginAndRegister = '/LoginAndRegisterView';
  // static const String otpVerify = '/OtpVerificationView';
  static const String emailVerify = '/EmailVerificationView';
  static const String reset1 = '/ResetPasswordView1';
  static const String reset2 = '/ResetPasswordView2';
  static const String reset3 = '/ResetPasswordView3';
  static const String home = '/HomeView';
  static const String booksDetails = '/BooksDetails';

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
      // GoRoute(
      //   path: otpVerify,
      //   builder: (context, state) => OtpVerificationView(),
      // ),
      GoRoute(
        path: emailVerify,
        builder: (context, state) => EmailVerificationView(),
      ),
      GoRoute(path: reset1, builder: (context, state) => ResetPasswordView1()),
      GoRoute(path: reset2, builder: (context, state) => ResetPasswordView2()),
      GoRoute(path: reset3, builder: (context, state) => ResetPasswordView3()),
      GoRoute(path: home, builder: (context, state) => HomeView()),
      GoRoute(
        path: booksDetails,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      SimilarBooksCubit(getIt.get<HomeRepoImplementation>()),
              child: BooksDetails(item: state.extra as Item),
            ),
      ),
    ],
  );
}
