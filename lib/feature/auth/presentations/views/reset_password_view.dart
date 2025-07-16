import 'package:bookly/feature/auth/presentations/views/widgets/reset_password_body.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6B5FF8),
      body: ResetPasswordBody(),
    );
  }
}
