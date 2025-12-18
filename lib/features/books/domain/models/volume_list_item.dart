import 'package:equatable/equatable.dart';

import '../../data/entities/volume.dart';

class VolumeListItem extends Equatable {
  const VolumeListItem({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.authors,
  });

  factory VolumeListItem.fromResponse(Volume volume) {
    return VolumeListItem(
      id: volume.id,
      title: volume.volumeInfo.title,
      imageUrl: volume.volumeInfo.imageLinks.thumbnail,
      authors: volume.volumeInfo.authors,
    );
  }

  final String id;
  final String title;
  final String? imageUrl;
  final List<String> authors;

  @override
  List<Object?> get props => [id, title, imageUrl, authors];
}
