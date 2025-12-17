import 'package:flutter_google_books/core/custom_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../domain/models/volume_list_item.dart';
import '../domain/volumes_repository.dart';
import 'data_sources/volume_data_source.dart';

@LazySingleton(as: VolumesRepository)
class VolumesRepositoryImpl implements VolumesRepository {
  VolumesRepositoryImpl(this._dataSource);

  final VolumesDataSource _dataSource;

  @override
  Future<Either<CustomError, List<VolumeListItem>>> getVolumesList(
    String query,
    int maxResults,
    int startIndex,
  ) async {
    try {
      final response = await _dataSource.getVolumes(
        query,
        maxResults,
        startIndex,
      );
      return Right(response.items.map(VolumeListItem.fromResponse).toList());
    } catch (e) {
      return Left(CustomError('GET_VOLUMES_ERROR', message: e.toString()));
    }
  }
}
