import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_minimalists/modules/auth/auth_module.dart';
import 'package:flutter_minimalists/modules/startup/startup_manager.dart';
import 'package:flutter_minimalists/modules/startup/startup_page.dart';

class StartupModule extends Module {
  @override
  List<Module> get imports => [
        GlobalAuthModule(),
      ];

  @override
  void binds(i) {
    i.addSingleton(StartupManager.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const StartupPage());
  }
}
