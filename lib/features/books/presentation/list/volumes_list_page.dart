import 'package:cached_network_image/cached_network_image.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/db/app_database.dart';
import 'package:flutter_google_books/features/books/presentation/detail/volume_detail_page.dart';
import 'package:flutter_google_books/features/books/presentation/list/state/volume_list_item_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/models/volume_list_item.dart';
import 'state/volumes_list_cubit.dart';
import 'widgets/search_bar.dart';

part 'widgets/sub_widgets.dart';
part 'widgets/volumes_list_view.dart';
part 'widgets/volume_list_item_widget.dart';

class VolumesListPage extends StatelessWidget {
  const VolumesListPage({super.key});

  static const routeName = '/volumes-list';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VolumesListCubit>(
      create: (context) => GetIt.I(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Books'),
          bottom: AppSearchBar(),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DriftDbViewer(GetIt.I<AppDatabase>()),
                ),
              ),
              icon: const Icon(Icons.library_books),
            ),
          ],
        ),
        body: BlocBuilder<VolumesListCubit, VolumesListState>(
          builder: (context, state) {
            return switch (state) {
              NoSearchText() => const _InitialView(),
              HasSearchText(pagingController: final pagingController) =>
                _VolumesListView(pagingController),
              _ => const _ProgressView(),
            };
          },
        ),
      ),
    );
  }
}
