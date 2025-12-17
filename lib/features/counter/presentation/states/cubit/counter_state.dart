part of 'counter_cubit.dart';

sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

final class CounterInitial extends CounterState {
  const CounterInitial();
}

final class CounterLoading extends CounterState {
  const CounterLoading();
}

final class CounterLoaded extends CounterState {
  final int value;

  const CounterLoaded(this.value);

  @override
  List<Object> get props => [value];
}

final class CounterError extends CounterState {
  final String message;

  const CounterError(this.message);

  @override
  List<Object> get props => [message];
}