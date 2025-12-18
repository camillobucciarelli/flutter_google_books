import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../domain/models/volume_detail.dart';
import 'state/volume_detail_cubit.dart';

class VolumeDetailPage extends StatelessWidget {
  const VolumeDetailPage({super.key, required this.id});

  static const routeName = '/volume-detail';

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VolumeDetailCubit>(
      create: (context) => GetIt.I()..init(id),
      child: Scaffold(
        appBar: AppBar(title: const Text('Book Detail'), centerTitle: true),
        body: BlocConsumer<VolumeDetailCubit, VolumeDetailState>(
          listenWhen: (previous, current) => current is VolumeDetailError,
          listener: (context, state) {
            if (state is VolumeDetailError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          buildWhen: (previous, current) => current is! VolumeDetailError,
          builder: (context, state) {
            return switch (state) {
              VolumeDetailLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              VolumeDetailLoaded(volumeDetail: final volumeDetail) =>
                _VolumeDetailWidget(volumeDetail),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}

class _VolumeDetailWidget extends StatelessWidget {
  const _VolumeDetailWidget(this.volumeDetail);

  final VolumeDetail volumeDetail;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Text(volumeDetail.title));
  }
}
