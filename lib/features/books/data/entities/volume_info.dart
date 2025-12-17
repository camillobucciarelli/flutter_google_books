import 'package:equatable/equatable.dart';
import 'package:flutter_google_books/core/json_image_link_converter.dart';
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
    this.imageLink,
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
  @JsonKey(name: 'imageLinks')
  @JsonImageLinkConverter()
  final String? imageLink;

  @override
  List<Object?> get props => [
    title,
    publisher,
    publishedDate,
    description,
    authors,
    imageLink,
  ];
}