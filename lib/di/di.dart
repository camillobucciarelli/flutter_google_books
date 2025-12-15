import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';

final _getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await _getIt.init();