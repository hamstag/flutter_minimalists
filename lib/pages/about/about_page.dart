import 'package:flutter/material.dart';
import 'package:flutter_minimalists/services/navigation_service.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => NavigationService.get().pop("I'am About"),
          child: const Text("Back"),
        ),
      ),
    );
  }
}
