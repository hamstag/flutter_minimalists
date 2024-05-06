import 'package:flutter_minimalists/pages/home/home_page_manager.dart';
import 'package:flutter_minimalists/services/dialog_service.dart';
import 'package:flutter_minimalists/services/navigation_service.dart';
import 'package:flutter_minimalists/services/pusher_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => PusherService());
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton(() => DialogService());
  getIt.registerLazySingleton(() => HomePageManager());
}
