import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Page')),
      body: const Center(
        child: Column(
          children: [
            Text('This is product page'),
          ],
        ),
      ),
    );
  }
}
