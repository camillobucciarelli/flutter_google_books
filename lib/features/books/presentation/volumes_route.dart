import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'detail/volume_detail_page.dart';
import 'list/volumes_list_page.dart';

part 'volumes_route.g.dart';

@TypedGoRoute<VolumesListRoute>(
  path: '/books',
  routes: [TypedGoRoute<VolumeDetailRoute>(path: ':id')],
)
@immutable
class VolumesListRoute extends GoRouteData with $VolumesListRoute {

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const VolumesListPage();
  }

}

@immutable
class VolumeDetailRoute extends GoRouteData with $VolumeDetailRoute {
  final String id;
  final String pageTitle;
  final String extra;

  const VolumeDetailRoute({
    required this.id,
    required this.pageTitle,
    required this.extra,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return VolumeDetailPage(id, pageTitle, extra: extra);
  }
}