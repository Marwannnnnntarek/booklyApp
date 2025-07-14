import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:bookly/feature/splash/views/widgets/splash1_body.dart';
import 'package:bookly/feature/splash/views/widgets/splash2_body.dart';
import 'package:bookly/feature/splash/views/widgets/splash3_body.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  final _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView(
          controller: _controller,
          children: const [Splash1Body(), Splash2Body(), Splash3Body()],
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.4,
          child: SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: Colors.white,
              dotColor: Colors.grey.shade500,
            ),
          ),
        ),
      ],
    );
  }
}
