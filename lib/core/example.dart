import 'dart:async';
import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';

class Example extends Disposable {
  late Timer timer;

  void hello(String msg) {
    Duration periodic = const Duration(seconds: 2);
    timer = Timer.periodic(periodic, (intervalTime) {
      log('Example $msg');
    });
  }

  @override
  void dispose() {
    log('Example dispose');
    timer.cancel();
  }
}
