import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/auth/presentations/cubit/auth/auth_cubit.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_button.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthRegister extends StatefulWidget {
  const AuthRegister({super.key});

  @override
  State<AuthRegister> createState() => _AuthRegisterState();
}

class _AuthRegisterState extends State<AuthRegister> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.push(AppRoutes.home);
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        } else if (state is EmailVerificationSent) {
          context.push(AppRoutes.emailVerify);
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
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            AuthTextField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              label: 'Password',
              hint: 'Minimum 8 characters',
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Confirm Password is required';
                }
                return null;
              },
              label: 'Confirm Password',
              hint: 'Repeat your password',
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
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                final isLoading = state is AuthLoading;
                return AuthButton(
                  label: 'Sign Up',
                  isLoading: isLoading,
                  onPressed:
                      isLoading
                          ? null
                          : () {
                            final password = passwordController.text.trim();
                            final confirmPassword =
                                confirmPasswordController.text.trim();
                            if (password != confirmPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Passwords do not match'),
                                ),
                              );
                              return;
                            }

                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().registerWithEmail(
                                emailController.text.trim(),
                                password,
                              );
                            }
                          },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
