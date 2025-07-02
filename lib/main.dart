import 'package:bookly/core/helpers/app_routes.dart';
import 'package:bookly/core/helpers/service_locator.dart';
import 'package:bookly/feature/home/data/repos/home_repo_implementation.dart';
import 'package:bookly/feature/home/presentation/view_model/best_seller_books/best_seller_books_cubit.dart';
import 'package:bookly/feature/home/presentation/view_model/books_cubit/books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
        BlocProvider(
          create:
              (context) =>
                  BooksCubit(getIt.get<HomeRepoImplementation>())..fetchBoosk(),
        ),
        BlocProvider(
          create:
              (context) =>
                  BestSellerBooksCubit(getIt.get<HomeRepoImplementation>())
                    ..fetchBestSellerBoosk(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
