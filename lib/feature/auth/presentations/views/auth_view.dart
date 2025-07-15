import 'package:bookly/feature/auth/presentations/views/widgets/auth_body.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AuthBody());
  }
}
