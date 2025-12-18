import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:http_cache_drift_store/http_cache_drift_store.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class DioModule {
  @lazySingleton
  AuthInterceptor get authInterceptor => AuthInterceptor();

  @preResolve
  Future<DriftCacheStore> get driftCacheStore async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final databasePath = documentDirectory.path;
    return DriftCacheStore(databasePath: databasePath);
  }

  @lazySingleton
  LoggyDioInterceptor get loggyDioInterceptor {
    return LoggyDioInterceptor(requestHeader: true);
  }

  @lazySingleton
  DioCacheInterceptor cacheInterceptor(DriftCacheStore driftCacheStore) {
    final cacheOptions = CacheOptions(
      store: driftCacheStore,
      policy: CachePolicy.forceCache,
    );
    return DioCacheInterceptor(options: cacheOptions);
  }

  @lazySingleton
  @Named('unauthenticated')
  Dio client(
    DioCacheInterceptor cacheInterceptor,
    LoggyDioInterceptor loggyDioInterceptor,
  ) {
    return Dio()..interceptors.addAll([cacheInterceptor, loggyDioInterceptor]);
  }

  @lazySingleton
  @Named('authenticated')
  Dio authClient(
    AuthInterceptor authInterceptor,
    DioCacheInterceptor cacheInterceptor,
    LoggyDioInterceptor loggyDioInterceptor,
  ) {
    final dio = Dio();
    dio.interceptors.addAll([
      authInterceptor,
      cacheInterceptor,
      loggyDioInterceptor,
    ]);
    return dio;
  }
}

class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authentication'] = 'my-token';
    return super.onRequest(options, handler);
  }
}
