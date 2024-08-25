import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class CounterStore extends Store<int> {
  CounterStore() : super(0);

  Future<void> increment() async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 1));

    int value = state + 1;
    if (value < 5) {
      update(value);
    } else {
      setError(Exception('Error: state can\'t be > 4'));
    }
    setLoading(false);
  }

  Future<void> decrement() async {
    setLoading(true);
    await Future.delayed(Durations.extralong1);
    update(state - 1);
    setLoading(false);
  }
}
