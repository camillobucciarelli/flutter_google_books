import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_books/presentation/my_home_page_cubit.dart';

import 'di/di.dart';

void main() {
  runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePageCubit(title: 'Flutter Demo Home Page'),
    );
  }
}
