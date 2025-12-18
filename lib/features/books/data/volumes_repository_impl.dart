import 'package:flutter_google_books/core/custom_error.dart';
import 'package:flutter_google_books/features/books/data/data_sources/favorite/favorite_volume_data_source.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../domain/models/volume_detail.dart';
import '../domain/models/volume_list_item.dart';
import '../domain/volumes_repository.dart';
import 'data_sources/volume/volume_data_source.dart';

@LazySingleton(as: VolumesRepository)
class VolumesRepositoryImpl implements VolumesRepository {
  VolumesRepositoryImpl(
    @Named('remote') this._remoteVolumeDataSource,
    @Named('local') this._localVolumeDatasource,
    @Named('local') this._favoriteVolumeDataSource,
  );

  final VolumesDataSource _remoteVolumeDataSource;
  final VolumesDataSource _localVolumeDatasource;
  final FavoriteVolumeDataSource _favoriteVolumeDataSource;

  @override
  Future<Either<CustomError, List<VolumeListItem>>> getVolumesList(
    String query,
    int maxResults,
    int startIndex,
  ) async {
    try {
      final hasInternetConnection = true;
      final response = hasInternetConnection
          ? await _remoteVolumeDataSource.getVolumes(
              query,
              maxResults,
              startIndex,
            )
          : await _remoteVolumeDataSource.getVolumes(
              query,
              maxResults,
              startIndex,
            );
      return Right(response.items.map(VolumeListItem.fromResponse).toList());
    } catch (e) {
      return Left(CustomError('GET_VOLUMES_ERROR', message: e.toString()));
    }
  }

  @override
  Future<Either<CustomError, VolumeDetail>> getVolumeDetail(String id) async {
    try {
      final result = await _remoteVolumeDataSource.getVolume(id);
      return Right(VolumeDetail.fromResponse(result));
    } catch (e) {
      return Left(CustomError('GET_VOLUME_DETAIL_ERROR', message: e.toString()));
    }
  }

  @override
  Future<Either<CustomError, void>> addFavorite(String id) async {
    try {
      await _favoriteVolumeDataSource.addFavorite(id);
      return Right(null);
    } catch (e) {
      return Left(CustomError('ADD_FAVORITE_ERROR', message: e.toString()));
    }
  }

  @override
  Future<Either<CustomError, bool>> isFavorite(String id) async {
    try {
      return Right(await _favoriteVolumeDataSource.isFavorite(id));
    } catch (e) {
      return Left(CustomError('IS_FAVORITE_ERROR', message: e.toString()));
    }
  }

  @override
  Future<Either<CustomError, void>> removeFavorite(String id) async {
    try {
      await _favoriteVolumeDataSource.removeFavorite(id);
      return Right(null);
    } catch (e) {
      return Left(CustomError('REMOVE_FAVORITE_ERROR', message: e.toString()));
    }
  }
}
