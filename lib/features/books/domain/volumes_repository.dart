import 'package:fpdart/fpdart.dart';

import '../../../core/custom_error.dart';
import 'models/volume_detail.dart';
import 'models/volume_list_item.dart';

abstract interface class VolumesRepository {
  Future<Either<CustomError, List<VolumeListItem>>> getVolumesList(
    String query,
    int maxResults,
    int startIndex,
  );

  Future<Either<CustomError, VolumeDetail>> getVolumeDetail(String id);

  Future<Either<CustomError, bool>> isFavorite(String id);

  Future<Either<CustomError, void>> addFavorite(String id);

  Future<Either<CustomError, void>> removeFavorite(String id);
}
