import 'package:dio/dio.dart';
import 'package:flutter_minimalists/core/config/config.dart';
import 'package:flutter_minimalists/core/services/http_client/auth_interceptor.dart';

typedef ResponseDTO<T> = ({
  bool didSuccess,
  int? statusCode,
  String? message,
  T? data,
});

class HttpClient {
  final Dio _dio;
  final AuthInterceptor _authInterceptor;

  HttpClient(this._dio, this._authInterceptor) {
    _dio.options.baseUrl = Config.baseUrl;
    _dio.interceptors.add(_authInterceptor);
  }
}
