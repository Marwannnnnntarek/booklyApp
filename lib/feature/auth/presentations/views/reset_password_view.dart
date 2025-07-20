import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/auth/presentations/view_model/cubit/auth_cubit.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_button.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_header2.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_text_field.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_toggle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff6B5FF8),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
                vertical: size.height * 0.08,
              ),
              child: Column(
                children: [
                  AuthHeader2(
                    title: 'Reset Your Password',
                    subTitle: 'Let’s help you return to your adventure.',
                  ),
                  const SizedBox(height: 20),
                  AuthTextField(
                    label: 'Email',
                    hint: 'you@example.com',
                    controller: emailController,
                  ),
                  const SizedBox(height: 4),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('An email will be sent to this address'),
                  ),
                  const Spacer(),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Password reset link sent. Check your email.',
                            ),
                          ),
                        );
                        context.push(
                          AppRoutes.loginAndRegister,
                        ); // Navigate back
                      } else if (state is AuthFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errMessage)),
                        );
                      }
                    },
                    builder: (context, state) {
                      return AuthButton(
                        label: 'Request',
                        isLoading: state is AuthLoading,
                        onPressed: () {
                          final email = emailController.text.trim();
                          if (email.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please enter your email'),
                              ),
                            );
                            return;
                          }
                          context.read<AuthCubit>().resetPassword(email);
                        },
                      );
                    },
                  ),
                  AuthToggleText(
                    actionText: 'Cancel Request',
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
