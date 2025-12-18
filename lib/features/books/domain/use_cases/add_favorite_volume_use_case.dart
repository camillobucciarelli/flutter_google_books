import 'package:flutter_google_books/features/books/domain/volumes_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/custom_error.dart';

@lazySingleton
class AddFavoriteVolumeUseCase {
  AddFavoriteVolumeUseCase(this._repository);

  final VolumesRepository _repository;

  Future<Either<CustomError, void>> call(String id) {
    return _repository.addFavorite(id);
  }
}
