import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_background.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_description.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_header.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_primary_button.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_secondry_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            const AuthBackground(),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.08,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AuthHeader(),
                    const SizedBox(height: 8),
                    const AuthDescription(),
                    const SizedBox(height: 20),
                    AuthPrimaryButton(
                      text: 'Sign In',
                      onPressed: () => context.push(AppRoutes.login),
                    ),
                    const SizedBox(height: 8),
                    AuthSecondaryButton(
                      text: 'Create an account',
                      onPressed: () => context.push(AppRoutes.register),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
