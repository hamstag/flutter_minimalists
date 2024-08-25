import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_minimalists/core/core_module.dart';
import 'package:flutter_minimalists/modules/auth/auth_manager.dart';
import 'package:flutter_minimalists/modules/auth/auth_service.dart';
import 'package:flutter_minimalists/modules/auth/auth_store.dart';
import 'package:flutter_minimalists/modules/auth/login/login_page.dart';
import 'package:flutter_minimalists/modules/auth/register/register_page.dart';

class GlobalAuthModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void exportedBinds(Injector i) {
    i.addSingleton(AuthStore.new);
    i.addSingleton(AuthService.new);
  }
}

class AuthModule extends Module {
  @override
  List<Module> get imports => [
        GlobalAuthModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton(AuthManager.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/login', child: (context) => const LoginPage());
    r.child('/register', child: (context) => const RegisterPage());
  }
}
