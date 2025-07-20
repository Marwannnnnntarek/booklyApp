import 'package:bookly/feature/auth/presentations/views/widgets/auth_logout.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_widgets/books_list_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff6B5FF8),
        appBar: AppBar(
          backgroundColor: Color(0xff6B5FF8),
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/Logo.png'),
              ),
              AuthLogout(),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.01,
            vertical: size.height * 0.01,
          ),
          child: BooksListView(),
        ),
      ),
    );
  }
}
