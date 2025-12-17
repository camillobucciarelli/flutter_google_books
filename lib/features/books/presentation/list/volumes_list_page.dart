import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/models/volume_list_item.dart';
import 'state/volumes_list_cubit.dart';
import 'widgets/search_bar.dart';

part 'widgets/sub_widgets.dart';

part 'widgets/volumes_list_view.dart';

class VolumesListPage extends StatelessWidget {
  const VolumesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VolumesListCubit>(
      create: (context) => GetIt.I(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Books'), bottom: AppSearchBar()),
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
