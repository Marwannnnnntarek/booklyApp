import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly/core/helpers/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Splash2Body extends StatelessWidget {
  final PageController controller;
  const Splash2Body({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/image 6 (1).png', fit: BoxFit.cover),
              Container(
                height: 700,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x006B5FF8),
                      Color(0xff6B5FF8), // Same as background
                    ],
                    stops: [0.5, 0.7],
                  ),
                ),
              ),
              Positioned(
                top: 450,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Center(
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
                    ),
                    Text(
                      'Discover +50 Million International Books Now',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Venture beyond borders with over 50 million books. Your next favorite read, from every corner of the world, awaits.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.go(AppRoutes.splashPageView),
                      child: const Text(
                        'Skip to login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
