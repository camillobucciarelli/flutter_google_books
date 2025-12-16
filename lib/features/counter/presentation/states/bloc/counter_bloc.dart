import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/read_counter_value_use_case.dart';
import '../../../domain/use_cases/save_counter_value_use_case.dart';

part 'counter_event.dart';

part 'counter_state.dart';

@injectable
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final ReadCounterValueUseCase _readCounterValueUseCase;
  final SaveCounterValueUseCase _saveCounterValueUseCase;

  CounterBloc(this._readCounterValueUseCase, this._saveCounterValueUseCase)
    : super(CounterInitial()) {
    on<InitCounterEvent>((event, emit) async {
      emit(CounterLoading());
      final counterValue = await _readCounterValueUseCase();
      counterValue.match(
        (error) => emit(CounterError(error.message ?? 'Unknown error')),
        (value) => emit(CounterLoaded(value)),
      );
    });
    on<AddCounterEvent>((event, emit) async {
      if (state case final CounterLoaded currentState) {
        final counterValue = currentState.value;
        _saveCounterValue(counterValue + 1, emit.call);
      }
    });
    on<SubtractCounterEvent>((event, emit) async {
      if (state case final CounterLoaded currentState) {
        final counterValue = currentState.value;
        _saveCounterValue(counterValue - 1, emit.call);
      }
    });
  }

  void _saveCounterValue(int value, EmitFunction emit) async {
    emit(CounterLoading());
    final result = await _saveCounterValueUseCase(value);
    result.match(
          (error) => emit(CounterError(error.message ?? 'Unknown error')),
          (_) => emit(CounterLoaded(value)),
    );
  }
}

typedef EmitFunction = void Function(CounterState);