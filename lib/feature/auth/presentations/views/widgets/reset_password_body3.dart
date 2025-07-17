import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_button.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_header2.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_text_field.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_toggle_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordBody3 extends StatelessWidget {
  ResetPasswordBody3({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
                  title: 'Choose A New Password',
                  subTitle: 'Secure your account with a new password.',
                ),
                const SizedBox(height: 20),
                AuthTextField(
                  label: 'Password',
                  hint: 'New password',
                  controller: passwordController,
                ),
                const SizedBox(height: 12),
                AuthTextField(
                  label: 'Confirm New Password',
                  hint: 'Re-enter your new password',
                  controller: confirmPasswordController,
                ),
                Spacer(),
                AuthButton(
                  label: 'Save & Login',
                  onPressed: () {
                    context.go(AppRoutes.loginAndRegister);
                  },
                ),
                AuthToggleText(
                  actionText: 'Cancel',
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
