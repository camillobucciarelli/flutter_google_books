import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/custom_error.dart';
import '../repositories/counter_repository.dart';

@lazySingleton
class SaveCounterValueUseCase {

  SaveCounterValueUseCase(this._repository);

  final CounterRepository _repository;

  Future<Either<CustomError, void>> call(int value) {
    return _repository.saveCounterValue(value);
  }
}