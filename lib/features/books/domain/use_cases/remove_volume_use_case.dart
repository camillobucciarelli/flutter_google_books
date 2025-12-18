import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/custom_error.dart';
import '../volumes_repository.dart';

@lazySingleton
class RemoveVolumeUseCase {
  RemoveVolumeUseCase(this._repository);

  final VolumesRepository _repository;

  Future<Either<CustomError, void>> call(String id) {
    return _repository.removeFavorite(id);
  }
}
