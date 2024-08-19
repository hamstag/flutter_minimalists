import 'package:flutter_minimalists/core/core_module.dart';
import 'package:flutter_minimalists/features/product/catalog/catalog_manager.dart';
import 'package:flutter_minimalists/features/product/catalog/catalog_page.dart';
import 'package:flutter_minimalists/features/product/product/product_manager.dart';
import 'package:flutter_minimalists/features/product/product/product_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(ProductManager.new);
    i.addLazySingleton(CatalogManager.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const ProductPage());
    r.child('/catalog', child: (context) => const CatalogPage());
  }
}
