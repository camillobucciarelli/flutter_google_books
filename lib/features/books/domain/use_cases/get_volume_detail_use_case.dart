import 'package:flutter_google_books/features/books/domain/models/volume_detail.dart';
import 'package:flutter_google_books/features/books/domain/volumes_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/custom_error.dart';

@lazySingleton
class GetVolumeDetailUseCase {
  GetVolumeDetailUseCase(this._repository);

  final VolumesRepository _repository;

  Future<Either<CustomError, VolumeDetail>> call(String id) async {
    final isFavorite = await _repository.isFavorite(id);
    final result = await _repository.getVolumeDetail(id);
    return result.map((volumeDetail) {
      return volumeDetail.copyWith(
        isFavorite: isFavorite.getOrElse((_) => false),
      );
    });
  }
}
