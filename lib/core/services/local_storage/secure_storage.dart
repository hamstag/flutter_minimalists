import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_minimalists/core/services/local_storage/local_storage.dart';

class SecureStorage implements LocalStorage {
  late FlutterSecureStorage storage;

  SecureStorage() {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    storage = FlutterSecureStorage(aOptions: getAndroidOptions());
  }

  @override
  Future<ErrorMsg?> set(String key, Object? value) async {
    try {
      await storage.write(key: key, value: jsonEncode(value));
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<T> get<T>(String key, T defaultValue) async {
    try {
      return jsonDecode(await storage.read(key: key) ?? 'null') as T;
    } catch (_) {
      return defaultValue;
    }
  }

  @override
  Future<void> remove(String key) async {
    return await storage.delete(key: key);
  }
}
