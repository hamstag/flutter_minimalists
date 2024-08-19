import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_minimalists/features/auth/auth_module.dart';
import 'package:flutter_minimalists/features/home/home_module.dart';
import 'package:flutter_minimalists/features/product/product_module.dart';
import 'package:flutter_minimalists/features/startup/startup_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module('/startup', module: StartupModule());
    r.module('/', module: HomeModule());
    r.module('/auth', module: AuthModule());
    r.module('/product', module: ProductModule());
  }
}
