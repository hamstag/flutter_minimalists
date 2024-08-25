import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_minimalists/modules/auth/auth_service.dart';
import 'package:flutter_minimalists/modules/auth/auth_store.dart';

class StartupManager extends Disposable {
  final AuthService _authService;
  final AuthStore _authStore;

  StartupManager(this._authService, this._authStore);

  Future<void> runStartupLogic() async {
    final v = await Future.wait([
      isLogged(),
      Future.delayed(const Duration(milliseconds: 2200)),
    ]);

    if (v[0]) {
      Modular.to.navigate('/');
      return;
    }

    Modular.to.navigate('/auth/login');
  }

  Future<bool> isLogged() async {
    final isValid = await _authStore.isValid();

    if (isValid) {
      final data = await _authService.authRefresh();
      _authStore.save(data.token, data.model);
    }

    return isValid;
  }

  @override
  void dispose() {
    log('StartupController dispose');
  }
}
