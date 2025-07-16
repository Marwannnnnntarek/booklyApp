import 'package:bookly/feature/auth/presentations/views/widgets/auth_button.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_header2.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_text_field.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_toggle_text.dart';
import 'package:flutter/material.dart';

class ResetPasswordBody extends StatelessWidget {
  ResetPasswordBody({super.key});
  final TextEditingController emailController = TextEditingController();
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('An OTP will be sent to this address'),
                ),
                Spacer(), // pushes up when keyboard shows
                AuthButton(label: 'Request OTP', onPressed: () {}),
                AuthToggleText(actionText: 'Cancel Request', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
