import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_minimalists/services/service_locator.dart';

class PusherService {
  static PusherService get() => getIt<PusherService>();

  late PusherChannelsClient pusher;

  Future<void> init() async {
    const hostOptions = PusherChannelsOptions.fromHost(
      scheme: "wss",
      host: "soketi.hamstag.com",
      key: "38ce09e5d71ff69c10594f97c83f167d",
      port: 443,
    );

    pusher = PusherChannelsClient.websocket(
      options: hostOptions,
      connectionErrorHandler: (exception, trace, refresh) {
        debugPrint(exception.toString());
        refresh();
      },
    );
  }
}
