import 'package:bookly/feature/auth/presentations/views/widgets/auth_button.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_header2.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_toggle_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthOtp extends StatelessWidget {
  AuthOtp({
    super.key,
    required this.label,
    required this.authButton,
    required this.authToggleText,
    required this.onPressed,
    required this.controller,
  });
  final String label, authButton, authToggleText;
  final void Function() onPressed;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthHeader2(
          title: 'Verify Your Email Address',
          subTitle: "Almost there! let's get your account verified",
        ),
        const SizedBox(height: 80),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
        ),
        const SizedBox(height: 4),
        PinCodeTextField(
          controller: controller,
          appContext: context,
          length: 6,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeColor: Colors.black,
            selectedColor: Colors.blue,
            inactiveColor: Colors.grey,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: AuthToggleText(actionText: 'Resend OTP?', onPressed: () {}),
        ),
        Spacer(),
        AuthButton(label: authButton, onPressed: onPressed),
        AuthToggleText(
          actionText: authToggleText,
          onPressed: () {
            context.pop();
          },
        ),
      ],
    );
  }
}
