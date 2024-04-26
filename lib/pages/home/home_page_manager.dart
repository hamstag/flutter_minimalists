import 'package:flutter/material.dart';
import 'package:flutter_minimalists/pages/home/notifiers/sample_notifier.dart';

class HomePageManager {
  final sample = SampleNotifier();
  final message = ValueNotifier<String>("Hello");
  final counter = ValueNotifier<int>(1);

  void setMessage(String newMessage) {
    message.value = newMessage;
  }

  void changeMePlease(String message) {
    sample.changeMe(message);
  }

  void plus() {
    counter.value++;
  }
}
