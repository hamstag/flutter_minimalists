import 'package:dio/dio.dart';
import 'package:flutter_minimalists/core/services/http_client/auth_interceptor.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_minimalists/core/services/http_client/http_client.dart';
import 'package:flutter_minimalists/core/services/local_storage/local_storage.dart';
import 'package:flutter_minimalists/core/services/local_storage/secure_storage.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add(AuthInterceptor.new);
    i.addInstance<Dio>(Dio());
    i.addSingleton(HttpClient.new);
    i.addSingleton<LocalStorage>(SecureStorage.new);
  }
}
