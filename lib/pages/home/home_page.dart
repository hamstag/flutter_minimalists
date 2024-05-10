import 'package:flutter/material.dart';
import 'package:flutter_minimalists/pages/about/about_page.dart';
import 'package:flutter_minimalists/pages/home/home_page_manager.dart';
import 'package:flutter_minimalists/pages/mercure/mercure_page.dart';
import 'package:flutter_minimalists/services/dialog_service.dart';
import 'package:flutter_minimalists/services/navigation_service.dart';
import 'package:flutter_minimalists/services/service_locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final manager = HomePageManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                NavigationService.state().push(MaterialPageRoute(
                    builder: (context) => const MercurePage()));
              },
              child: const Text("Mercure Page"),
            ),
            ValueListenableBuilder<String>(
              valueListenable: getIt<HomePageManager>().message,
              child: ElevatedButton(
                onPressed: () {
                  getIt<HomePageManager>().setMessage("Hey!");
                },
                child: const Text("Change"),
              ),
              builder: (context, message, child) {
                debugPrint('Rebuild message');
                return Column(
                  children: [
                    Text(message),
                    child!,
                  ],
                );
              },
            ),
            const VerticalDivider(indent: 32),
            ValueListenableBuilder<String>(
              valueListenable: getIt<HomePageManager>().sample,
              child: ElevatedButton(
                onPressed: () {
                  getIt<HomePageManager>().sample.changeMe("Oh");
                },
                child: const Text("Change me"),
              ),
              builder: (context, message, child) {
                debugPrint('Change me');
                return Column(
                  children: [Text(message), child!],
                );
              },
            ),
            const VerticalDivider(indent: 32),
            ValueListenableBuilder<int>(
              valueListenable: manager.counter,
              child: ElevatedButton(
                onPressed: () {
                  manager.plus();
                  getIt<HomePageManager>().setMessage("CodeSpace");
                  getIt<HomePageManager>().changeMePlease("CodeSpace");
                },
                child: const Text("+"),
              ),
              builder: (context, value, child) {
                debugPrint('Rebuild counter');
                return Column(
                  children: [
                    Text(value.toString()),
                    child!,
                  ],
                );
              },
            ),
            const VerticalDivider(indent: 32),
            ElevatedButton(
              onPressed: () async {
                final result = await NavigationService.state().push(
                    MaterialPageRoute(builder: (context) => const AboutPage()));

                debugPrint(result?[0]);
              },
              child: const Text("About"),
            ),
            const VerticalDivider(indent: 32),
            ElevatedButton(
              onPressed: () => DialogService.get().alert(),
              child: const Text("Alert"),
            ),
          ],
        ),
      ),
    );
  }
}
