import 'package:flutter/material.dart';
import 'package:flutter_minimalists/pages/mercure/mercure_page_manager.dart';

class MercurePage extends StatefulWidget {
  const MercurePage({super.key});

  @override
  State<MercurePage> createState() => _MercurePageState();
}

class _MercurePageState extends State<MercurePage> {
  final manager = MercurePageManager();

  @override
  void initState() {
    manager.mercure();
    super.initState();
  }

  @override
  void dispose() {
    manager.unsubscription();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mercure"),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: manager.message,
          builder: (context, value, child) => Text(value),
        ),
      ),
    );
  }
}
