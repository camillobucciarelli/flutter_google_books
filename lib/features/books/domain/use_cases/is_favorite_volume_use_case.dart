import 'package:flutter_google_books/features/books/domain/volumes_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/custom_error.dart';

@lazySingleton
class IsFavoriteVolumeUseCase {
  IsFavoriteVolumeUseCase(this._repository);

  final VolumesRepository _repository;

  Future<Either<CustomError, bool>> call(String id) {
    return _repository.isFavorite(id);
  }
}
