import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/auth/presentations/view_model/cubit/auth_cubit.dart';
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
  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
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
      child: Column(
        children: [
          AuthTextField(
            label: 'Email or Phone Number',
            hint: 'you@example.com or +201234567890',
            controller: emailOrPhoneController,
          ),
          const SizedBox(height: 20),
          AuthTextField(
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
                          final input = emailOrPhoneController.text.trim();
                          final password = passwordController.text.trim();
                          final confirmPassword =
                              confirmPasswordController.text.trim();
                          final isPhone = RegExp(
                            r'^\+?[0-9]{10,15}$',
                          ).hasMatch(input);
                          final isEmail = RegExp(
                            r'^[\w\.-]+@[\w\.-]+\.\w+$',
                          ).hasMatch(input);
                          if (password != confirmPassword) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Passwords do not match'),
                              ),
                            );
                            return;
                          }
                          if (!isPhone && !isEmail) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Enter a valid email or phone number',
                                ),
                              ),
                            );
                            return;
                          }
                          context.read<AuthCubit>().registerWithEmail(
                            input,
                            password,
                          );
                        },
              );
            },
          ),
        ],
      ),
    );
  }
}
