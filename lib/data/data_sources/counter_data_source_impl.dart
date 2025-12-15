import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'counter_data_source.dart';

@LazySingleton(as: CounterDataSource)
class CounterDataSourceImpl implements CounterDataSource {

  static const counterKey = 'counter';

  @override
  Future<int> readCounterValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(counterKey) ?? 0;
  }

  @override
  Future<void> saveCounterValue(int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(counterKey, value);
  }

}