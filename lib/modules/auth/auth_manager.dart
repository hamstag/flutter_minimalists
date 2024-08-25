import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_minimalists/core/base_manager.dart';
import 'package:flutter_minimalists/modules/auth/auth_service.dart';
import 'package:flutter_minimalists/modules/auth/auth_store.dart';

class AuthManager extends BaseManager {
  final AuthService _authService;
  final AuthStore _authStore;

  AuthManager(this._authService, this._authStore);

  Future<void> login() async {
    setLoading(true);
    final response = await _authService.login((username: "", password: ""));

    if (!response.didSuccess) {}

    final data = response.data!;

    _authStore.save(data.token, data.model);
    Modular.to.navigate('/');
    setLoading(false);
  }

  Future<void> register() async {
    setLoading(true);
    await _authService.register();
    setLoading(false);
  }

  Future<void> logout() async {
    setLoading(true);
    await _authService.logout();
    _authStore.clear();
    setLoading(false);
  }
}
