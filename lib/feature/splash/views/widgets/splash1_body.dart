import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/splash/views/widgets/splash_page_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splash1Body extends StatelessWidget {
  final PageController controller;
  const Splash1Body({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SplashPageBody(
      controller: controller,
      image: 'assets/images/image 5 (1).png',
      text1: 'Welcome to Bookly! Your Next Adventure Awaits',
      text2:
          'Embark on a literary journey with books recommendations that match your unique tastes for an adventure in every read.',
      textButton1: 'Continue',
      onPressed1: () {
        controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      textButton2: 'Skip to login',
      onPressed2: () {
        context.go(AppRoutes.loginAndRegister);
      },
    );
  }
}
//    