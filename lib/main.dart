import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_minimalists/app_module.dart';
import 'package:flutter_minimalists/app_widget.dart';
import 'package:flutter_triple/flutter_triple.dart';

void main() {
  TripleObserver.addListener((triple) {
    log(triple.toString(), name: 'TripleObserver');
  });
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
