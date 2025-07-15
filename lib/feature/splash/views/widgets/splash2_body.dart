import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/splash/views/widgets/splash_page_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splash2Body extends StatelessWidget {
  final PageController controller;
  const Splash2Body({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SplashPageBody(
      controller: controller,
      image: 'assets/images/image 6 (1).png',
      text1: 'Discover International Books Now',
      text2:
          'Venture beyond borders with many books. Your next favorite read, from every corner of the world, awaits.',
      textButton1: 'Continue',
      onPressed1: () {
        controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      textButton2: 'Skip to login',
      onPressed2: () {
        context.go(AppRoutes.home);
      },
    );
  }
}
