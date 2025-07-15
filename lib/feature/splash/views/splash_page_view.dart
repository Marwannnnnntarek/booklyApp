import 'package:flutter/material.dart';
import 'package:bookly/feature/splash/views/widgets/splash1_body.dart';
import 'package:bookly/feature/splash/views/widgets/splash2_body.dart';
import 'package:bookly/feature/splash/views/widgets/splash3_body.dart';

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
          Splash1Body(controller: _controller),
          Splash2Body(controller: _controller),
          Splash3Body(controller: _controller),
        ],
      ),
    );
  }
}
