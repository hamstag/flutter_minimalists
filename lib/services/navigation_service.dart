import 'package:flutter/widgets.dart';
import 'package:flutter_minimalists/services/service_locator.dart';

class NavigationService {
  static NavigationService get() => getIt<NavigationService>();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState state() => get().navigatorKey.currentState!;

  void pop<T extends Object>([T? result]) {
    if (state().canPop()) {
      return state().pop([result]);
    }
  }

  void popUntil(String routeName) {
    state().popUntil(ModalRoute.withName(routeName));
  }
}
