import 'package:bookly/feature/auth/presentations/views/widgets/auth_animated_switcher.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_header.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_toggle_button.dart';
import 'package:flutter/material.dart';

class LoginAndRegisterBody extends StatefulWidget {
  const LoginAndRegisterBody({super.key});

  @override
  State<LoginAndRegisterBody> createState() => _LoginAndRegisterBodyState();
}

class _LoginAndRegisterBodyState extends State<LoginAndRegisterBody> {
  bool isLoginSelected = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
              vertical: size.height * 0.08,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AuthHeader(),
                const SizedBox(height: 40),
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
                const SizedBox(height: 30),
                AuthAnimatedSwitcher(isLoginSelected: isLoginSelected),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
