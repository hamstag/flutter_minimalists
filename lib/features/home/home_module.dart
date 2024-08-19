import 'package:flutter_minimalists/core/core_module.dart';
import 'package:flutter_minimalists/features/home/counter/counter_page.dart';
import 'package:flutter_minimalists/features/home/home_manager.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_minimalists/features/auth/auth_module.dart';
import 'package:flutter_minimalists/features/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
        GlobalAuthModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton(HomeManager.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/counter', child: (context) => const CounterPage());
  }
}
