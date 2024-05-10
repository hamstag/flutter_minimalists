import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_minimalists/services/dialog_service.dart';
import 'package:flutter_minimalists/services/mercure/mercure.dart';
import 'package:flutter_minimalists/services/mercure/mercure_event.dart';

class MercurePageManager {
  final message = ValueNotifier<String>("Hello");
  late StreamSubscription<MercureEvent> _subscription;
  late StreamSubscription<MercureEvent> _subscriptionExample;

  void mercure() async {
    final Mercure mercure = Mercure(
      url: "",
      topics: [
        "",
      ],
      token: "",
    );

    _subscription = mercure.listen((event) {
      debugPrint(event.id);
      debugPrint(event.type);
      debugPrint(event.data);

      message.value = event.data;
      DialogService.get().alert(message: event.data);
    });

    final example = Mercure(
      url: "",
      topics: [
        "https://example.com",
      ],
    );

    _subscriptionExample = example.listen((event) {
      debugPrint(event.id);
      debugPrint(event.type);
      debugPrint(event.data);
    });
  }

  void unsubscription() async {
    _subscription.cancel();
    _subscriptionExample.cancel();
  }
}
