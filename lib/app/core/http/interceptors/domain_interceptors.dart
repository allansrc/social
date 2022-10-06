import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DomainInterceptors extends Interceptor {
  // TODO(allansrc): implements this
  // final AuthStore authStore = Modular.get<AuthStore>();

  DomainInterceptors();

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // TODO(allansrc): implements this
    // options.baseUrl = EnviromentVariables().urlDomain;
    return super.onRequest(options, handler);
  }
}
