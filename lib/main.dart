import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/core/data/services/service_locator.dart';
import 'package:bookly/feature/auth/presentations/cubit/auth/auth_cubit.dart';
import 'package:bookly/feature/home/data/repos/home_repo_implementation.dart';
import 'package:bookly/feature/home/presentation/cubit/books_cubit/books_cubit.dart';
import 'package:bookly/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(
          create:
              (context) =>
                  BooksCubit(getIt.get<HomeRepoImplementation>())..fetchBoosk(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
