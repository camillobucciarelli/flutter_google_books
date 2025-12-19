import 'dart:async';

import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/app_state/app_state_cubit.dart';
import 'package:flutter_google_books/router.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:get_it/get_it.dart';
import 'package:loggy/loggy.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'di/di.dart';
import 'l10n/app_localizations.dart';
import 'theme/app_theme.dart';

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
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (_) => 'This field is required',
        ValidationMessage.minLength: (_) => 'This field must be at least 8 characters',
      },
      child: BlocProvider<AppStateCubit>(
        create: (context) => GetIt.I(),
        child: BlocSelector<AppStateCubit, AppState, Locale?>(
          selector: (state) => state.locale,
          builder: (context, locale) {
            return MaterialApp.router(
              title: 'Flutter Demo',
              theme: buildTheme(Brightness.light),
              darkTheme: buildTheme(Brightness.dark),
              themeMode: ThemeMode.dark,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: locale,
              builder: (context, child) => AccessibilityTools(child: child),
              routerConfig: appRouter,
            );
          },
        ),
      ),
    );
  }
}
