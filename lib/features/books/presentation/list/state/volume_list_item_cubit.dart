import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_google_books/features/books/domain/use_cases/is_favorite_volume_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/add_favorite_volume_use_case.dart';
import '../../../domain/use_cases/remove_volume_use_case.dart';

part 'volume_list_item_state.dart';

@injectable
class VolumeListItemCubit extends Cubit<VolumeListItemState> {
  VolumeListItemCubit(
    this._isFavoriteVolumeUseCase,
    this._addFavoriteVolumeUseCase,
    this._removeVolumeUseCase,
  ) : super(VolumeListItemState());

  final IsFavoriteVolumeUseCase _isFavoriteVolumeUseCase;
  final AddFavoriteVolumeUseCase _addFavoriteVolumeUseCase;
  final RemoveVolumeUseCase _removeVolumeUseCase;

  void init(String id) async {
    final result = await _isFavoriteVolumeUseCase(id);
    result.match(
      (error) => emit(VolumeListItemState()),
      (isFavorite) => emit(VolumeListItemState(isFavorite: isFavorite)),
    );
  }

  void toggleFavorite(String id) async {
    if (state.isFavorite) {
      final result = await _removeVolumeUseCase(id);
      result.match(
        (error) => emit(VolumeListItemState()),
        (_) => emit(VolumeListItemState(isFavorite: false)),
      );
    } else {
      final result = await _addFavoriteVolumeUseCase(id);
      result.match(
        (error) => emit(VolumeListItemState()),
        (_) => emit(VolumeListItemState(isFavorite: true)),
      );
    }
  }
}
