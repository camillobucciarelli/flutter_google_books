import 'package:equatable/equatable.dart';

import '../../data/entities/volume.dart';

class VolumeDetail extends Equatable {
  const VolumeDetail({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.authors,
    this.description,
    this.publisher,
    this.publishedDate,
    required this.categories,
    required this.averageRating,
    required this.ratingsCount,
    this.isFavorite = false,
  });

  factory VolumeDetail.fromResponse(Volume volume) {
    return VolumeDetail(
      id: volume.id,
      title: volume.volumeInfo.title,
      imageUrl: volume.volumeInfo.imageLinks.large,
      authors: volume.volumeInfo.authors,
      description: volume.volumeInfo.description,
      publisher: volume.volumeInfo.publisher,
      publishedDate: volume.volumeInfo.publishedDate,
      categories: volume.volumeInfo.categories,
      averageRating: volume.volumeInfo.averageRating,
      ratingsCount: volume.volumeInfo.ratingsCount,
    );
  }

  final String id;
  final String title;
  final String? imageUrl;
  final List<String> authors;
  final String? description;
  final String? publisher;
  final DateTime? publishedDate;
  final List<String> categories;
  final int averageRating;
  final int ratingsCount;
  final bool isFavorite;

  VolumeDetail copyWith({bool? isFavorite}) {
    return VolumeDetail(
      id: id,
      title: title,
      imageUrl: imageUrl,
      authors: authors,
      description: description,
      publisher: publisher,
      publishedDate: publishedDate,
      categories: categories,
      averageRating: averageRating,
      ratingsCount: ratingsCount,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    imageUrl,
    authors,
    description,
    publisher,
    publishedDate,
    categories,
    averageRating,
    ratingsCount,
    isFavorite,
  ];
}
