import 'package:bookly/feature/auth/presentations/views/widgets/auth_widgets/auth_body.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xff6B5FF8), body: AuthBody());
  }
}
