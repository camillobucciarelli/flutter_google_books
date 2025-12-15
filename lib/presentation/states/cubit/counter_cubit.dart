import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/read_counter_value_use_case.dart';
import '../../../domain/use_cases/save_counter_value_use_case.dart';

part 'counter_state.dart';

@injectable
class CounterCubit extends Cubit<CounterState> {
  CounterCubit(this._readCounterValueUseCase, this._saveCounterValueUseCase)
    : super(CounterInitial());

  final ReadCounterValueUseCase _readCounterValueUseCase;
  final SaveCounterValueUseCase _saveCounterValueUseCase;

  void init() async {
    emit(CounterLoading());
    final result = await _readCounterValueUseCase();
    result.match(
      (error) => emit(CounterError(error.message ?? 'Unknown error')),
      (value) => emit(CounterLoaded(value)),
    );
  }

  void add() async {
    if (state case final CounterLoaded currentState) {
      final counterValue = currentState.value;
      _saveCounterValue(counterValue + 1);
    }
  }

  void subtract() {
    if (state case final CounterLoaded currentState) {
      final counterValue = currentState.value;
      _saveCounterValue(counterValue - 1);
    }
  }

  void _saveCounterValue(int value) async {
    emit(CounterLoading());
    final result = await _saveCounterValueUseCase(value);
    result.match(
      (error) => emit(CounterError(error.message ?? 'Unknown error')),
      (_) => emit(CounterLoaded(value)),
    );
  }
}
