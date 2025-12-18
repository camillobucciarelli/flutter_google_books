import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_google_books/features/books/domain/use_cases/get_volume_detail_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/models/volume_detail.dart';

part 'volume_detail_state.dart';

@injectable
class VolumeDetailCubit extends Cubit<VolumeDetailState> {
  VolumeDetailCubit(this._getVolumeDetailUseCase)
    : super(const VolumeDetailLoading());

  final GetVolumeDetailUseCase _getVolumeDetailUseCase;

  void init(String id) async {
    final result = await _getVolumeDetailUseCase(id);
    result.match(
      (error) => emit(VolumeDetailError(error.code)),
      (volumeDetail) => emit(VolumeDetailLoaded(volumeDetail)),
    );
  }
}
