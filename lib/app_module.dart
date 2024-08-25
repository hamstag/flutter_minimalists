import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_minimalists/modules/auth/auth_module.dart';
import 'package:flutter_minimalists/modules/home/home_module.dart';
import 'package:flutter_minimalists/modules/product/product_module.dart';
import 'package:flutter_minimalists/modules/startup/startup_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module('/startup', module: StartupModule());
    r.module('/', module: HomeModule());
    r.module('/auth', module: AuthModule());
    r.module('/product', module: ProductModule());
  }
}
