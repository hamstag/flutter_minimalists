typedef ErrorMsg = String;

abstract interface class LocalStorage {
  Future<ErrorMsg?> set(String key, Object? value);
  Future<T> get<T>(String key, T defaultValue);
  Future<void> remove(String key);
}
