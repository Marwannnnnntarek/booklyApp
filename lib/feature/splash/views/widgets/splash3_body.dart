import 'package:flutter/material.dart';

class Splash3Body extends StatelessWidget {
  const Splash3Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Center(child: Text('screen 3')),
      ),
    );
  }
}
