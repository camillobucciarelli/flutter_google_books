import 'package:flutter_google_books/domain/repositories/counter_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/custom_error.dart';
import '../data_sources/counter_data_source.dart';

@LazySingleton(as: CounterRepository)
class CounterRepositoryImpl implements CounterRepository {

  CounterRepositoryImpl(this._dataSource);

  final CounterDataSource _dataSource;

  @override
  Future<Either<CustomError, int>> readCounterValue() async {
    try {
      return _dataSource.readCounterValue().then((value) => right(value));
    } catch (e) {
      return left(CustomError('READ_ERROR', message: e.toString()));
    }
  }

  @override
  Future<Either<CustomError, void>> saveCounterValue(int value) async {
    try {
      return _dataSource.saveCounterValue(value).then((value) => right(value));
      } catch (e) {
      return left(CustomError('SAVE_ERROR', message: e.toString()));
    }
  }

}