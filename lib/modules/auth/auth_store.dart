import 'package:flutter/foundation.dart';
import 'package:flutter_minimalists/core/services/local_storage/local_storage.dart';
import 'package:flutter_minimalists/modules/auth/auth_model.dart';

class AuthStore {
  final LocalStorage _storage;

  AuthStore(this._storage);

  final _storageKey = 'app_auth';

  late String? _token;
  String? get token => _token;

  final _model = ValueNotifier<AuthModel?>(null);
  ValueNotifier<AuthModel?> get model => _model;

  void updateFirstName() {
    _model.value = _model.value?.copyWith(firstName: "Hi");
  }

  Future<void> save(String token, AuthModel model) async {
    await _storage.set(_storageKey, {'token': token, 'model': model.toJson()});
    _token = token;
    _model.value = model;
  }

  Future<void> clear() async {
    await _storage.remove(_storageKey);
    _token = null;
    _model.value = null;
  }

  Future<bool> isValid() async {
    try {
      final data = await _storage.get<Map<String, dynamic>?>(_storageKey, null);

      if (data == null) {
        return false;
      }

      _token = data['token'] as String;
      _model.value = AuthModel.fromJson(data['model']);

      return !isTokenExpired(_token!);
    } catch (_) {
      return false;
    }
  }

  bool isTokenExpired(String token) {
    return false;
  }
}
