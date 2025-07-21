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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AuthTextField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                }
                return null;
              },
              label: 'Email',
              hint: 'you@example.com',
              controller: emailController,
            ),
            const SizedBox(height: 20),
            AuthTextField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
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
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().loginWithEmail(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                            }
                          },
                );
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: AuthToggleText(
                actionText: 'Forgot password?',
                onPressed: () {
                  context.push(AppRoutes.reset);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
