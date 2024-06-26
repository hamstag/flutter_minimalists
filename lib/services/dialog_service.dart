import 'package:flutter/material.dart';
import 'package:flutter_minimalists/services/navigation_service.dart';
import 'package:flutter_minimalists/services/service_locator.dart';

class DialogService {
  static DialogService get() => getIt<DialogService>();

  final BuildContext context =
      NavigationService.get().navigatorKey.currentState!.overlay!.context;

  Future<void> alert({String message = "Hello"}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("AlertDialog Title"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              const Text('This is a demo alert dialog.'),
              const Text('Would you like to approve of this message?'),
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () => NavigationService.get().pop(),
          ),
        ],
      ),
    );
  }
}
