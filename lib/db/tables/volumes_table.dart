import 'package:drift/drift.dart';

import '../converters/string_list_converter.dart';

class VolumesTable extends Table {
  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get publisher => text().nullable()();

  DateTimeColumn get publishedDate => dateTime().named('published_date')();

  TextColumn get description => text()();

  TextColumn get authors =>
      text().nullable().map(const StringListConverter())();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
