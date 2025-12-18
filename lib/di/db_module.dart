import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:drift_flutter/drift_flutter.dart';

@module
abstract class DbModule {
  @singleton
  QueryExecutor get openConnection =>  driftDatabase(name: 'app_db');
}
