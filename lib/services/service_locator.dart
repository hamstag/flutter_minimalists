import 'package:flutter_minimalists/pages/home/home_page_manager.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<HomePageManager>(() => HomePageManager());
}
