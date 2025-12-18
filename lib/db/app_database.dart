import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../features/books/data/data_sources/favorite/local_favorite_volume_data_source.dart';
import '../features/books/data/data_sources/volume/local_volumes_data_source.dart';
import 'app_database.steps.dart';
import 'converters/converters.dart';
import 'tables/tables.dart';

part 'app_database.g.dart';

@singleton
@DriftDatabase(
  tables: [VolumesTable, FavoritesVolumes],
  daos: [LocalVolumesDataSource, LocalFavoriteVolumeDataSource],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onUpgrade: _schemaUpgrade);
  }
}

extension Migrations on GeneratedDatabase {
  OnUpgrade get _schemaUpgrade => stepByStep(
    from2To3: (m, schema) async {
      await m.createTable(schema.volumesTable);
    },
    from3To4: (m, schema) async {
      await m.createTable(schema.favoritesVolumes);
    },
  );
}
