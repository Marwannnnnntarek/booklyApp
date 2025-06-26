import 'package:bookly/feature/view/home/views/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: HomeAppBar()));
  }
}
