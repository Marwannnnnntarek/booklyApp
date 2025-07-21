import 'package:bookly/feature/auth/presentations/views/widgets/auth_animated_switcher.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_header.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_toggle_button.dart';
import 'package:flutter/material.dart';

class LoginAndRegisterView extends StatefulWidget {
  const LoginAndRegisterView({super.key});

  @override
  State<LoginAndRegisterView> createState() => _LoginAndRegisterViewState();
}

class _LoginAndRegisterViewState extends State<LoginAndRegisterView> {
  bool isLoginSelected = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff6B5FF8),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
          vertical: size.height * 0.04,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthHeader(
              image: 'assets/images/Star 8.png',
              logo: 'assets/images/Logo.png',
            ),
            SizedBox(height: size.height * 0.04),
            // Toggle Buttons
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE5E5E5), // gray background
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthToggleButton(
                    text: "Login",
                    isSelected: isLoginSelected,
                    onTap: () {
                      setState(() {
                        isLoginSelected = true;
                      });
                    },
                  ),
                  AuthToggleButton(
                    text: "Register",
                    isSelected: !isLoginSelected,
                    onTap: () {
                      setState(() {
                        isLoginSelected = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            AuthAnimatedSwitcher(isLoginSelected: isLoginSelected),
          ],
        ),
      ),
    );
  }
}
