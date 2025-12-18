part of 'volume_detail_cubit.dart';

sealed class VolumeDetailState extends Equatable {
  const VolumeDetailState();
}

final class VolumeDetailLoading extends VolumeDetailState {
  const VolumeDetailLoading();

  @override
  List<Object> get props => [];
}

final class VolumeDetailLoaded extends VolumeDetailState {
  const VolumeDetailLoaded(this.volumeDetail);

  final VolumeDetail volumeDetail;


  @override
  List<Object> get props => [volumeDetail];
}

final class VolumeDetailError extends VolumeDetailState {
  const VolumeDetailError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}