import 'package:flutter_google_books/domain/repositories/counter_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/custom_error.dart';

@lazySingleton
class ReadCounterValueUseCase {

  ReadCounterValueUseCase(this._repository);

  final CounterRepository _repository;

  Future<Either<CustomError, int>> call() {
    return _repository.readCounterValue();
  }
}
