import 'package:flutter/material.dart';
import 'package:flutter_minimalists/pages/about/about_page_manager.dart';
import 'package:flutter_minimalists/services/navigation_service.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final manager = AboutPageManager();

  @override
  void initState() {
    manager.subscribe();
    super.initState();
  }

  @override
  void dispose() {
    manager.unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: Center(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: manager.message,
              builder: (context, value, child) => Text(value),
            ),
            ElevatedButton(
              onPressed: () => NavigationService.get().pop("I'am About"),
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
