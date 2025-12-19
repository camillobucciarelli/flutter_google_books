import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/features/counter/presentation/counter_cubit_page.dart';
import 'package:flutter_google_books/login_page.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'app_state/app_state_cubit.dart';
import 'db/app_database.dart';
import 'features/books/presentation/detail/volume_detail_page.dart';
import 'features/books/presentation/list/volumes_list_page.dart';
import 'features/books/presentation/volumes_route.dart';
import 'home_page.dart';
import 'login_page_reactive.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/books',
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Error')),
    body: Center(child: Text(state.error.toString())),
  ),
  routes: [
    GoRoute(
      name: 'db.viewer',
      path: '/db-viewer',
      onExit: (context, state) async {
        final result = await showAdaptiveDialog<bool>(
          context: context,
          builder: (context) => AlertDialog.adaptive(
            title: const Text('Exit'),
            content: const Text('Are you sure you want to exit?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text('exit'),
              ),
            ],
          ),
        );

        return result ?? false;
      },
      pageBuilder: (context, state) {
        return MaterialPage(
          child: DriftDbViewer(GetIt.I<AppDatabase>()),
          fullscreenDialog: true,
        );
      },
      redirect: (context, state) {
        if (context.read<AppStateCubit>().state.isUserLoggedIn) {
          return null;
        }
        return '/login';
      },
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => LoginPageReactive(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) {
        return HomePage(child);
      },
      branches: [
        // 1 element
        StatefulShellBranch(
          routes: [
            $volumesListRoute
            // GoRoute(
            //   name: 'volumes-list',
            //   path: '/books',
            //   builder: (context, state) => const VolumesListPage(),
            //   routes: [
            //     GoRoute(
            //       name: 'volume-detail',
            //       path: ':id',
            //       builder: (context, state) => VolumeDetailPage(
            //         state.pathParameters['id']!,
            //         state.uri.queryParameters['pageTitle']!,
            //         extra: state.extra!,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
        // 2 element
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/counter',
              builder: (context, state) =>
                  const CounterCubitPage(title: 'Counter'),
            ),
          ],
        ),
      ],
      // routes: <RouteBase>[
      //   // 1 element
      //   GoRoute(
      //     path: '/books',
      //     builder: (context, state) => const VolumesListPage(),
      //     routes: [
      //       GoRoute(
      //         path: ':id',
      //         builder: (context, state) => VolumeDetailPage(
      //           state.pathParameters['id']!,
      //           state.uri.queryParameters['pageTitle']!,
      //         ),
      //       ),
      //     ],
      //   ),
      //   // 2 element
      //   GoRoute(
      //     path: '/counter',
      //     builder: (context, state) => const CounterCubitPage(title: 'Counter'),
      //   ),
      // ],
    ),
  ],
);
