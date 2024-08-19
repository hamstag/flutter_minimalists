import 'package:flutter_minimalists/core/base_manager.dart';
import 'package:flutter_minimalists/features/auth/auth_store.dart';

class HomeManager extends BaseManager {
  final AuthStore _authStore;

  HomeManager(this._authStore);

  void updateFirstName() {
    _authStore.updateFirstName();
  }
}
