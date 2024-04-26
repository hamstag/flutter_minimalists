import 'package:flutter/material.dart';

class SampleNotifier extends ValueNotifier<String> {
  SampleNotifier() : super(_initialValue);

  static const String _initialValue = 'Hello';

  void changeMe(String message) {
    value = message;
  }
}
