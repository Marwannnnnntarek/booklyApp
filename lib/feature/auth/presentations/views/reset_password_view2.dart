import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_otp.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordView2 extends StatelessWidget {
  const ResetPasswordView2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff6B5FF8),
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
              child: AuthOtp(
                label: 'Input your OTP',
                authButton: 'Verify Email Address',
                authToggleText: 'Previous step',
                onPressed: () {
                  context.push(AppRoutes.reset3);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
