import 'package:bookly/feature/splash/views/widgets/splash_back_ground_color.dart';
import 'package:bookly/feature/splash/views/widgets/splash_page_indicator.dart';
import 'package:bookly/feature/splash/views/widgets/splash_text1.dart';
import 'package:bookly/feature/splash/views/widgets/splash_text2.dart';
import 'package:bookly/feature/splash/views/widgets/splash_text_button1.dart';
import 'package:bookly/feature/splash/views/widgets/splash_text_button2.dart';
import 'package:flutter/material.dart';

class SplashPageViewBody extends StatelessWidget {
  final void Function()? onPressed1, onPressed2;
  final PageController controller;
  final String image, text1, text2, textButton1, textButton2;

  const SplashPageViewBody({
    super.key,
    required this.controller,
    required this.image,
    required this.text1,
    required this.text2,
    required this.textButton1,
    required this.textButton2,
    required this.onPressed2,
    required this.onPressed1,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: size.height,
              width: size.width,
            ),
            const SplashBackGroundColor(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.08,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SplashPageIndicator(controller: controller),
                    const SizedBox(height: 12),
                    SplashText1(text1: text1),
                    const SizedBox(height: 8),
                    SplashText2(text2: text2),
                    const SizedBox(height: 20),
                    CustomTextButton1(
                      textButton1: textButton1,
                      onPressed1: onPressed1,
                    ),
                    const SizedBox(height: 10),
                    CustomTextButton2(
                      textButton2: textButton2,
                      onPressed2: onPressed2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
