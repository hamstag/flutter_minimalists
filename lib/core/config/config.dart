import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

abstract class Config {
  static const String baseUrl = String.fromEnvironment("baseUrl");
  static const String apiKey = String.fromEnvironment("apiKey");
}

BindConfig<T> storeConfig<T extends Store>() {
  return BindConfig<T>(
    notifier: (value) => value.selectAll,
    onDispose: (value) => value.destroy(),
  );
}
