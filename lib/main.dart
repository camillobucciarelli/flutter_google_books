import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_books/features/books/presentation/list/volumes_list_page.dart';
import 'package:flutter_google_books/router.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:loggy/loggy.dart';

import 'di/di.dart';

void main() {
  runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();
    Loggy.initLoggy(
      logPrinter: const PrettyDeveloperPrinter(),
    );
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
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.routeFactory,
    );
  }
}
