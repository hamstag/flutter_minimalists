import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catelog Page')),
      body: const Center(
        child: Column(
          children: [
            Text('This is catelog page'),
          ],
        ),
      ),
    );
  }
}
