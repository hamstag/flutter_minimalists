import 'dart:async';
import 'dart:convert';

import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_minimalists/services/dialog_service.dart';
import 'package:flutter_minimalists/services/pusher_service.dart';

class AboutPageManager {
  final message = ValueNotifier<String>("Hello");

  final pusher = PusherService.get().pusher;

  late StreamSubscription connectionSub;
  late StreamSubscription<ChannelReadEvent> myEvent;

  Future<void> subscribe() async {
    debugPrint("subscribe()");

    final channel = pusher.publicChannel("my-channel");

    connectionSub = pusher.onConnectionEstablished
        .listen((_) => channel.subscribeIfNotUnsubscribed());

    unawaited(pusher.connect());

    myEvent = channel.bind("my-event").listen((event) {
      debugPrint(event.data);

      final data = jsonDecode(event.data) as Map<String, dynamic>;
      message.value = data["message"] ?? "undefined";

      DialogService.get().alert(message: data["message"]);
    });
  }

  Future<void> unsubscribe() async {
    connectionSub.cancel();
    myEvent.cancel();
    unawaited(pusher.disconnect());
  }
}
