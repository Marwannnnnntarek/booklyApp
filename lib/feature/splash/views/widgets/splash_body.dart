import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
    required Animation<double> fadeAnimation,
    required Animation<double> scaleAnimation,
  }) : _fadeAnimation = fadeAnimation,
       _scaleAnimation = scaleAnimation;

  final Animation<double> _fadeAnimation;
  final Animation<double> _scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Hero(
            tag: 'splash-title',
            child: Image.asset(
              'assets/images/Logo.png', // Use your logo here
            ),
          ),
        ),
      ),
    );
  }
}
