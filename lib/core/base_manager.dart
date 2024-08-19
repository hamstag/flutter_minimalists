import 'package:flutter/material.dart';

abstract class BaseManager {
  final _isLoading = ValueNotifier<bool>(false);

  ValueNotifier<bool> get isLoading => _isLoading;

  void setLoading(bool v) {
    _isLoading.value = v;
  }
}
