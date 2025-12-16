part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

final class InitCounterEvent extends CounterEvent {}

final class AddCounterEvent extends CounterEvent {}

final class SubtractCounterEvent extends CounterEvent {}


