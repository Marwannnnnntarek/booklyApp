import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        controller: controller,
        count: 3,
        effect: WormEffect(
          dotHeight: 8,
          dotWidth: 8,
          activeDotColor: Colors.white,
          dotColor: Colors.grey.shade500,
        ),
      ),
    );
  }
}
