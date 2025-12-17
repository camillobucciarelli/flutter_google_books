import 'package:fpdart/fpdart.dart';

import '../../../core/custom_error.dart';
import 'models/volume_list_item.dart';

abstract interface class VolumesRepository {
  Future<Either<CustomError, List<VolumeListItem>>> getVolumesList(
    String query,
    int maxResults,
    int startIndex,
  );
}
