import 'package:drift/drift.dart';

class FavoritesVolumes extends Table {
  late final id = text()();
  late final createdAt = dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
