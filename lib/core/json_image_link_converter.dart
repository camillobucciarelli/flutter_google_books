import 'package:json_annotation/json_annotation.dart';

class JsonImageLinkConverter implements JsonConverter<String, Map<String, dynamic>> {
  const JsonImageLinkConverter();

  @override
  String fromJson(Map<String, dynamic> json) {
    return json['thumbnail'];
  }

  @override
  Map<String, dynamic> toJson(String object) {
    return {'thumbnail': object};
  }
}
