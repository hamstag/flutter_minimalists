import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Page')),
      body: Center(
        child: Column(
          children: [
            const Text('This is register page'),
            ElevatedButton(
              onPressed: () => Modular.to.navigate('/auth/login'),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
