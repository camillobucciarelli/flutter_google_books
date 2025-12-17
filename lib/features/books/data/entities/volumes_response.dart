import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'volume.dart';

part 'volumes_response.g.dart';

@JsonSerializable(createToJson: false)
class VolumesResponse with EquatableMixin {
  const VolumesResponse(this.kind, this.totalItems, this.items);

  factory VolumesResponse.fromJson(Map<String, dynamic> json) => _$VolumesResponseFromJson(json);

  final String kind;
  final int totalItems;
  final List<Volume> items;

  @override
  List<Object?> get props => [kind, totalItems, items];
}
