import 'package:bookly/feature/auth/presentations/views/widgets/auth_widgets/login_body.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_widgets/register_body.dart';
import 'package:flutter/material.dart';

class AuthAnimatedSwitcher extends StatelessWidget {
  const AuthAnimatedSwitcher({super.key, required this.isLoginSelected});

  final bool isLoginSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isLoginSelected ? LoginBody() : RegisterBody(),
    );
  }
}
