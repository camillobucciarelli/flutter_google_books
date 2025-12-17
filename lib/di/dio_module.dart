import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @lazySingleton
  @Named('unauthenticated')
  Dio get client => Dio();

  @lazySingleton
  @Named('authenticated')
  Dio get authClient {
    final dio = Dio();
    dio.interceptors.add(AuthInterceptor());
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
