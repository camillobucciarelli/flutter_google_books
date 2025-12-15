import 'package:flutter_google_books/core/custom_error.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class CounterRepository {
  Future<Either<CustomError, void>> saveCounterValue(int value);

  Future<Either<CustomError, int>> readCounterValue();
}