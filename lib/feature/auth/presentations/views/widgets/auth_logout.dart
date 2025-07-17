import 'package:bookly/feature/auth/presentations/view_model/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthLogout extends StatelessWidget {
  const AuthLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.logout),
      onPressed: () {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text('Confirm Sign Out'),
                content: Text('are you sure you want to sign out?'),
                actions: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => context.read<AuthCubit>().logout(),
                    child: Text('Sign out'),
                  ),
                ],
              ),
        );
      },
    );
  }
}
