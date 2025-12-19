import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/core/localization_extension.dart';
import 'package:flutter_google_books/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import 'app_state/app_state_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_getTitle(context)),
        actions: [
          DropdownButton<Locale>(
            items: [
              DropdownMenuItem<Locale>(value: null, child: Text(
                  context.appLocalizations.system)),
              ...AppLocalizations.supportedLocales.map((e) {
                return DropdownMenuItem<Locale>(
                  value: e,
                  child: Text(e.languageCode),
                );
              }),
            ],
            value: context.read<AppStateCubit>().state.locale,
            onChanged: (value) {
              if (value != null) {
                context.read<AppStateCubit>().changeLocale(value);
              } else {
                context.read<AppStateCubit>().resetLocale();
              }
            },
          ),
        ],
      ),
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: context.appLocalizations.books,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: context.appLocalizations.counter,
          ),
        ],
        currentIndex: _currentIndex(context),
        // onTap: (index) => _onItemTapped(context, index),
        // onTap: navigationShell.goBranch,
        onTap: (index) => _onItemTappedReset(context, index),
      ),
    );
  }

  void _onItemTappedReset(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      context.go('/books');
    }
    if (index == 1) {
      context.go('/counter');
    }
  }

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/books')) {
      return 0;
    }
    if (location.startsWith('/counter')) {
      return 1;
    }
    return 0;
  }

  String _getTitle(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/books')) {
      return 'Books';
    }
    if (location.startsWith('/counter')) {
      return 'Counter';
    }
    return 'Home';
  }
}
