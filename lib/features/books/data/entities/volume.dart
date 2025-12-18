import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'volume_info.dart';

part 'volume.g.dart';

@JsonSerializable(createToJson: false)
class Volume extends Equatable {
  const Volume(this.id, this.volumeInfo);

  factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);

  final String id;
  final VolumeInfo volumeInfo;

  @override
  List<Object?> get props => [id, volumeInfo];
}
