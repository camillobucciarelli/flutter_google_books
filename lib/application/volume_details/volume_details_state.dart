part of 'volume_details_cubit.dart';

@freezed
abstract class VolumeDetailsState with _$VolumeDetailsState {
  const factory VolumeDetailsState({
    required List<Volume> favorites,
  }) = _VolumeDetailsState;

  factory VolumeDetailsState.initial() {
    return const VolumeDetailsState(favorites: []);
  }
}
