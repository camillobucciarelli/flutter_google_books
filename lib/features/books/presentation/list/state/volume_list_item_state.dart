part of 'volume_list_item_cubit.dart';

class VolumeListItemState extends Equatable {
  const VolumeListItemState({this.isFavorite = false});

  final bool isFavorite;

  @override
  List<Object?> get props => [isFavorite];
}

sealed class VolumeListItemAction extends VolumeListItemState {
  const VolumeListItemAction({super.isFavorite = false});
}