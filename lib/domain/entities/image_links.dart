import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_links.freezed.dart';

@freezed
abstract class ImageLinks with _$ImageLinks {
  factory ImageLinks({
    required String thumbnail,
    required String large,
    required String medium,
    required String small,
  }) = _ImageLinks;
}
