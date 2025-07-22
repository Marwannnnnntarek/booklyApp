import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/splash/views/widgets/splash_page_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          SplashPageViewBody(
            controller: _controller,
            image: 'assets/images/image 5 (1).png',
            text1: 'Welcome to Bookly! Your Next Adventure Awaits',
            text2:
                'Embark on a literary journey with books recommendations that match your unique tastes for an adventure in every read.',
            textButton1: 'Continue',
            onPressed1: () {
              _controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            textButton2: 'Skip to login',
            onPressed2: () {
              context.go(AppRoutes.loginAndRegister);
            },
          ),
          SplashPageViewBody(
            controller: _controller,
            image: 'assets/images/image 6 (1).png',
            text1: 'Discover International Books Now',
            text2:
                'Venture beyond borders with many books. Your next favorite read, from every corner of the world, awaits.',
            textButton1: 'Continue',
            onPressed1: () {
              _controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            textButton2: 'Skip to login',
            onPressed2: () {
              context.go(AppRoutes.loginAndRegister);
            },
          ),
          SplashPageViewBody(
            controller: _controller,
            image: 'assets/images/image 9.png',
            text1: 'Crafted For You: Your Personal Book Oasis',
            text2:
                'Let us be your guide through a landscape of literature designed to match your unique taste and interests.',
            textButton1: 'Start My Adventure',
            onPressed1: () {
              context.push(AppRoutes.loginAndRegister);
            },
            textButton2: 'Back to start',
            onPressed2: () {
              _controller.animateToPage(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
    );
  }
}
