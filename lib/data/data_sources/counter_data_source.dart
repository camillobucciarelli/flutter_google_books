abstract interface class CounterDataSource {
  Future<void> saveCounterValue(int value);

  Future<int> readCounterValue();
}