import 'package:bookly/feature/auth/presentations/views/widgets/auth_otp.dart';
import 'package:flutter/material.dart';

class EmailVerificationBody extends StatelessWidget {
  const EmailVerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
          vertical: size.height * 0.08,
        ),
        child: AuthOtp(
          title: 'Verify Your Email Address',
          subTitle: "Almost there! let's get your account verified",
          label: 'Input your OTP',
        ),
      ),
    );
  }
}
