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
  final TextEditingController emailController = TextEditingController();
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
          context.push(AppRoutes.verify);
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
            hint: 'you@example.com',
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
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final isLoading = state is AuthLoading;
              return AuthButton(
                label: 'Sign up',
                isLoading: isLoading,
                onPressed:
                    isLoading
                        ? null
                        : () {
                          if (passwordController.text !=
                              confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Passwords do not match'),
                              ),
                            );
                            return;
                          }
                          context.read<AuthCubit>().register(
                            emailController.text.trim(),
                            passwordController.text.trim(),
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
