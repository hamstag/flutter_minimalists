import 'package:flutter/material.dart';
import 'package:flutter_minimalists/pages/home/home_page_manager.dart';
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
            )
          ],
        ),
      ),
    );
  }
}
