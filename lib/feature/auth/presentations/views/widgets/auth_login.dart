import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/auth/presentations/view_model/cubit/auth_cubit.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_button.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_text_field.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_toggle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthLogin extends StatefulWidget {
  const AuthLogin({super.key});

  @override
  State<AuthLogin> createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.go(AppRoutes.home);
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      child: Column(
        children: [
          AuthTextField(
            label: 'Email address',
            hint: 'Enter your email',
            controller: emailController,
          ),
          const SizedBox(height: 20),
          AuthTextField(
            label: 'Password',
            hint: 'Enter your password',
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
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final isLoading = state is AuthLoading;
              return AuthButton(
                label: 'Sign in',
                isLoading: isLoading,
                onPressed:
                    isLoading
                        ? null
                        : () {
                          context.read<AuthCubit>().login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        },
              );
            },
          ),
          Align(
            alignment: Alignment.topLeft,
            child: AuthToggleText(
              actionText: 'Forgot password?',
              onPressed: () {
                context.push(AppRoutes.reset1);
              },
            ),
          ),
        ],
      ),
    );
  }
}
