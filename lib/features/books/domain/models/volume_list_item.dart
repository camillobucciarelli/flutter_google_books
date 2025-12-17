import 'package:equatable/equatable.dart';

import '../../data/entities/volume.dart';

class VolumeListItem extends Equatable {
  const VolumeListItem({
    required this.title,
    this.imageUrl,
    required this.authors,
  });

  factory VolumeListItem.fromResponse(Volume volume) {
    return VolumeListItem(
      title: volume.volumeInfo.title,
      imageUrl: volume.volumeInfo.imageLink,
      authors: volume.volumeInfo.authors,
    );
  }

  final String title;
  final String? imageUrl;
  final List<String> authors;

  @override
  List<Object?> get props => [title, imageUrl, authors];
}
