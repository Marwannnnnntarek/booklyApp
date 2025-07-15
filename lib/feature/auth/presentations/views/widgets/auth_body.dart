import 'package:bookly/feature/auth/presentations/views/login_view.dart';
import 'package:bookly/feature/auth/presentations/views/register_view.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/custom_toggle_button.dart';
import 'package:flutter/material.dart';

class AuthBody extends StatefulWidget {
  const AuthBody({super.key});

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> {
  bool isLoginSelected = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
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
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset('assets/images/Star 8.png'),
                ),
                const SizedBox(height: 44),
                Text(
                  'Bookly App',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                      CustomToggleButton(
                        text: "Login",
                        isSelected: isLoginSelected,
                        onTap: () {
                          setState(() {
                            isLoginSelected = true;
                          });
                        },
                      ),
                      CustomToggleButton(
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
                // View Body
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child:
                      isLoginSelected
                          ? const LoginView()
                          : const RegisterView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
