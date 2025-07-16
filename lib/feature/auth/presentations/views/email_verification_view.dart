import 'package:bookly/feature/auth/presentations/views/widgets/email_verification_body.dart';
import 'package:flutter/material.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6B5FF8),
      body: EmailVerificationBody(),
    );
  }
}
