import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 8.0,
      title: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(
              'assets/images/Logo.png', // Use your logo here
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
