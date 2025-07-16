import 'package:bookly/feature/auth/presentations/views/widgets/login_and_register_body.dart';
import 'package:flutter/material.dart';

class LoginAndRegisterView extends StatelessWidget {
  const LoginAndRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6B5FF8),
      body: LoginAndRegisterBody(),
    );
  }
}
