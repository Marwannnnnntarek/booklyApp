import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/splash/views/widgets/splash_page_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splash3Body extends StatelessWidget {
  final PageController controller;
  const Splash3Body({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SplashPageBody(
      controller: controller,
      image: 'assets/images/image 9.png',
      text1: 'Crafted For You: Your Personal Book Oasis',
      text2:
          'Let us be your guide through a landscape of literature designed to match your unique taste and interests.',
      textButton1: 'Start My Adventure',
      onPressed1: () {
        context.push(AppRoutes.auth);
      },
      textButton2: 'Back to start',
      onPressed2: () {
        controller.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
