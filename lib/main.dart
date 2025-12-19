import 'dart:async';

import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/app_state/app_state_cubit.dart';
import 'package:flutter_google_books/router.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:get_it/get_it.dart';
import 'package:loggy/loggy.dart';

import 'di/di.dart';
import 'l10n/app_localizations.dart';

void main() {
  runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();
    Loggy.initLoggy(logPrinter: const PrettyDeveloperPrinter());
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppStateCubit>(
      create: (context) => GetIt.I(),
      child: BlocSelector<AppStateCubit, AppState, Locale?>(
        selector: (state) => state.locale,
        builder: (context, locale) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.light),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow, brightness: Brightness.dark),
              useMaterial3: true,
            ),
            themeMode: ThemeMode.dark,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: locale,
            builder: (context, child) => AccessibilityTools(child: child),
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
