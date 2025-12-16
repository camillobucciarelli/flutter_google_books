import 'dart:async';

import 'package:flutter/material.dart';

import 'di/di.dart';
import 'features/counter/presentation/my_home_page_cubit.dart';

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
