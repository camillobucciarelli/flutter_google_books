part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class CounterLoading extends CounterState {}

final class CounterLoaded extends CounterState {
  final int value;

  CounterLoaded(this.value);
}

final class CounterError extends CounterState {
  final String message;

  CounterError(this.message);
}