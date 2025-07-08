import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly/core/helpers/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);

    _animationController.forward();

    Timer(const Duration(seconds: 3), _handleAuthRedirect);
  }

  Future<void> _handleAuthRedirect() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      context.go(AppRoutes.signin);
      return;
    }

    try {
      await user.reload();
      final refreshedUser = FirebaseAuth.instance.currentUser;

      if (refreshedUser != null && refreshedUser.emailVerified) {
        context.go(AppRoutes.home);
      } else {
        context.go(AppRoutes.verify);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        await FirebaseAuth.instance.signOut();
        context.go(AppRoutes.signin);
      } else {
        // handle other possible auth errors
        debugPrint('Auth error during reload: ${e.message}');
        context.go(AppRoutes.signin);
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(child: Image.asset('assets/images/Logo.png')),
      ),
    );
  }
}
