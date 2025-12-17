import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HttpModule {

  @lazySingleton
  @Named('unauthenticated')
  Client get client => Client();

  @lazySingleton
  @Named('authenticated')
  Client get userAgentClient => AuthClient('my-token', client);
}

class AuthClient extends BaseClient {
  final String token;
  final Client _inner;

  AuthClient(this.token, this._inner);

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['Authentication'] = token;
    return _inner.send(request);
  }
}