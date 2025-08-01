import 'package:bookly/feature/auth/presentations/views/widgets/auth_logout.dart';
import 'package:bookly/feature/home/presentation/view/widgets/home_books_list_view.dart';
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
              Align(
                alignment: Alignment.topLeft,
                child: PopupMenuButton<String>(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  color: Colors.white, // Optional: use theme for dark/light
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 6,
                  onSelected: (value) {},
                  itemBuilder: (context) => [],
                ),
              ),
              SizedBox(
                height: size.height * 0.5,
                width: size.width * 0.5,
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
          child: HomeBooksListView(),
        ),
      ),
    );
  }
}
