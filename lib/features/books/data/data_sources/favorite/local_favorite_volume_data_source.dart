import 'package:drift/drift.dart';
import 'package:flutter_google_books/features/books/data/data_sources/favorite/favorite_volume_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../../db/app_database.dart';
import '../../../../../db/tables/favorites_volumes.dart';

part 'local_favorite_volume_data_source.g.dart';

@Named('local')
@LazySingleton(as: FavoriteVolumeDataSource)
@DriftAccessor(tables: [FavoritesVolumes])
class LocalFavoriteVolumeDataSource extends DatabaseAccessor<AppDatabase>
    with _$LocalFavoriteVolumeDataSourceMixin
    implements FavoriteVolumeDataSource {
  LocalFavoriteVolumeDataSource(super.attachedDatabase);

  @override
  Future<void> addFavorite(String id) async {
    await transaction(() async {
      await into(
        favoritesVolumes,
      ).insert(FavoritesVolumesCompanion.insert(id: id));
    });
  }

  @override
  Future<bool> isFavorite(String id) async {
    final query = select(favoritesVolumes)..where((tbl) => tbl.id.equals(id));
    final results = await query.getSingleOrNull();
    return results != null;
  }

  @override
  Future<void> removeFavorite(String id) async {
    await transaction(() async {
      final query = delete(favoritesVolumes)..where((tbl) => tbl.id.equals(id));
      final results = await query.go();
      if (results == 0) {
        throw Exception('Error removing favorite');
      }
    });
  }
}
