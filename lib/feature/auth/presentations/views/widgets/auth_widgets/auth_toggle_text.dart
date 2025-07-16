import 'package:flutter/material.dart';

class AuthToggleText extends StatelessWidget {
  const AuthToggleText({
    super.key,
    required this.actionText,
    required this.onPressed,
  });
  final String actionText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Align(
        alignment: Alignment.topRight,
        child: Text('Forgot password?', style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
