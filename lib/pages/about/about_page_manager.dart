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
  late StreamSubscription<ChannelReadEvent> myEvent, myPrivateEvent;

  Future<void> subscribe() async {
    debugPrint("subscribe()");

    final privateChannel = pusher.privateChannel(
      "private-my-channel",
      authorizationDelegate:
          EndpointAuthorizableChannelTokenAuthorizationDelegate
              .forPrivateChannel(
        authorizationEndpoint:
            Uri.parse('https://localhost.hamstag.com/pusher/auth'),
        headers: const {
          "Authorization": "Bearer 1234567890",
        },
      ),
    );

    final channel = pusher.publicChannel("my-channel");

    connectionSub = pusher.onConnectionEstablished.listen((_) {
      privateChannel.subscribeIfNotUnsubscribed();
      channel.subscribeIfNotUnsubscribed();
    });

    unawaited(pusher.connect());

    myPrivateEvent = privateChannel.bind("my-event").listen((event) {
      debugPrint(event.data);

      final data = jsonDecode(event.data) as Map<String, dynamic>;
      message.value = data["message"] ?? "undefined";

      DialogService.get().alert(message: data["message"]);
    });

    myEvent = channel.bind("my-event").listen((event) {
      debugPrint(event.data);
    });
  }

  Future<void> unsubscribe() async {
    connectionSub.cancel();
    myPrivateEvent.cancel();
    myEvent.cancel();
    unawaited(pusher.disconnect());
  }
}
