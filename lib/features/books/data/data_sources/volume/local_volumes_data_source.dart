import 'package:drift/drift.dart';
import 'package:flutter_google_books/db/app_database.dart';
import 'package:flutter_google_books/db/tables/volumes_table.dart';
import 'package:flutter_google_books/features/books/data/data_sources/volume/volume_data_source.dart';
import 'package:flutter_google_books/features/books/data/entities/volume.dart';
import 'package:flutter_google_books/features/books/data/entities/volumes_response.dart';
import 'package:injectable/injectable.dart';

part 'local_volumes_data_source.g.dart';

@Named('local')
@LazySingleton(as: VolumesDataSource)
@DriftAccessor(tables: [VolumesTable])
class LocalVolumesDataSource extends DatabaseAccessor<AppDatabase>
    with _$LocalVolumesDataSourceMixin
    implements VolumesDataSource {
  LocalVolumesDataSource(super.attachedDatabase);

  @override
  Future<VolumesResponse> getVolumes(
    String query,
    int maxResults,
    int startIndex,
  ) async {
    final volumes = await volumesTable.select().get();
    return VolumesResponse('books#volumes', volumes.length, []);
  }

  @override
  Future<Volume> getVolume(String id) {
    // TODO: implement getVolume
    throw UnimplementedError();
  }

}
