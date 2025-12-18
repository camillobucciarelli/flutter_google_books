import 'package:flutter/material.dart';

import 'features/books/presentation/detail/volume_detail_page.dart';
import 'features/books/presentation/list/volumes_list_page.dart';

class AppRouter {
  static const initialRoute = VolumesListPage.routeName;

  static RouteFactory get routeFactory => (settings) {
    switch (settings.name) {
      case VolumesListPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const VolumesListPage(),
          settings: settings,
        );
      case VolumeDetailPage.routeName:
        final id = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => VolumeDetailPage(id: id),
          settings: settings,
        );
    }
    return null;
  };
}
