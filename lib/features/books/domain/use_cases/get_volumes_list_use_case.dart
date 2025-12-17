import 'package:flutter_google_books/features/books/domain/volumes_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/custom_error.dart';
import '../models/volume_list_item.dart';

@lazySingleton
class GetVolumesListUseCase {
  GetVolumesListUseCase(this._repository);

  final VolumesRepository _repository;

  Future<Either<CustomError, List<VolumeListItem>>> call(String query, int pageItems, int page) {
    String preparedQuery = query.trim().replaceAll(' ', '+');
    return _repository.getVolumesList(preparedQuery, pageItems, page * pageItems);
  }
}
