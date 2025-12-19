import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/core/localization_extension.dart';
import 'package:flutter_google_books/features/books/presentation/list/state/volume_list_item_cubit.dart';
import 'package:flutter_google_books/features/books/presentation/volumes_route.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';

import '../../../../db/app_database.dart';
import '../../domain/models/volume_list_item.dart';
import 'state/volumes_list_cubit.dart';
import 'widgets/search_bar.dart';

part 'widgets/sub_widgets.dart';

part 'widgets/volumes_list_view.dart';

part 'widgets/volume_list_item_widget.dart';

class VolumesListPage extends StatelessWidget {
  const VolumesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VolumesListCubit>(
      create: (context) => GetIt.I(),
      child: BlocBuilder<VolumesListCubit, VolumesListState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(child: AppSearchBar()),
                  IconButton(
                    onPressed: () => context.pushNamed('db.viewer'),
                    icon: const Icon(Icons.library_books),
                    tooltip: 'db viewer',
                  ),
                ],
              ),
              Expanded(
                child: switch (state) {
                  NoSearchText() => const _InitialView(),
                  HasSearchText(pagingController: final pagingController) =>
                    _VolumesListView(pagingController),
                  _ => const _ProgressView(),
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
