import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/json_date_converter.dart';

part 'volume_info.g.dart';

@JsonSerializable(createToJson: false)
class VolumeInfo with EquatableMixin {
  const VolumeInfo(
    this.title,
    this.publisher,
    this.publishedDate,
    this.description,
    this.authors,
    this.imageLinks,
    this.categories,
    this.averageRating,
    this.ratingsCount,
  );

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);

  final String title;
  final String? publisher;
  @JsonDateConverter()
  final DateTime? publishedDate;
  final String? description;
  @JsonKey(defaultValue: <String>[])
  final List<String> authors;
  final ImageLinks imageLinks;
  @JsonKey(defaultValue: <String>[])
  final List<String> categories;
  @JsonKey(defaultValue: 0)
  final int averageRating;
  @JsonKey(defaultValue: 0)
  final int ratingsCount;

  @override
  List<Object?> get props => [
    title,
    publisher,
    publishedDate,
    description,
    authors,
    imageLinks,
    categories,
    averageRating,
    ratingsCount,
  ];
}

@JsonSerializable(createToJson: false)
class ImageLinks extends Equatable {
  const ImageLinks(this.thumbnail, this.large);

  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);

  final String? thumbnail;
  final String? large;

  @override
  List<Object?> get props => [thumbnail, large];
}
