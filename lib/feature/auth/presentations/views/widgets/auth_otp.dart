import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_button.dart';
import 'package:bookly/feature/auth/presentations/views/widgets/auth_toggle_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthOtp extends StatelessWidget {
  const AuthOtp({
    super.key,
    required this.label,
    required this.title,
    required this.subTitle,
  });
  final String label, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Text(
          subTitle,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
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
        const SizedBox(height: 80),
        AuthButton(
          label: 'Continue',
          onPressed: () {
            context.go(AppRoutes.home);
          },
        ),
      ],
    );
  }
}
