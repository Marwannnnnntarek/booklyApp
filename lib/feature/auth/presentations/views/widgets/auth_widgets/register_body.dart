import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_widgets/auth_button.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
          label: 'Email address',
          hint: 'example@gmail',
          controller: emailController,
        ),
        const SizedBox(height: 20),
        AuthTextField(
          label: 'Password',
          hint: 'minimum 8 characters',
          controller: passwordController,
          isPassword: true,
          obscureText: _obscurePassword,
          togglePassword: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        const SizedBox(height: 20),
        AuthTextField(
          label: 'Confirm password',
          hint: 'repeat your password',
          controller: confirmPasswordController,
          isPassword: true,
          obscureText: _obscureConfirmPassword,
          togglePassword: () {
            setState(() {
              _obscureConfirmPassword = !_obscureConfirmPassword;
            });
          },
        ),
        const SizedBox(height: 20),
        AuthButton(
          label: 'Sign up',
          onPressed: () {
            context.go(AppRoutes.home);
          },
        ),
      ],
    );
  }
}
