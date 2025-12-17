import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

final _dateFormatter = DateFormat('yyyy-MM-dd');
final _yearMonthFormatter = DateFormat('yyyy-MM');
final _yearFormatter = DateFormat('yyyy');

class JsonDateConverter implements JsonConverter<DateTime?, String?> {
  const JsonDateConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json == null) {
      return null;
    }
    final dateParts = json.split('-');
    if (dateParts.length == 1) {
      return _yearFormatter.parse(json);
    }
    if (dateParts.length == 2) {
      return _yearMonthFormatter.parse(json);
    }
    if (dateParts.length == 3) {
      return _dateFormatter.parse(json);
    }
    throw Exception('Invalid date format');
  }

  @override
  String? toJson(DateTime? object) {
    if (object == null) {
      return null;
    }
    return _dateFormatter.format(object);
  }
}
