import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_minimalists/modules/auth/auth_manager.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                const Text('This is login page'),
                ElevatedButton(
                  onPressed: () async =>
                      await Modular.get<AuthManager>().login(),
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () => Modular.to.navigate('/auth/register'),
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable: Modular.get<AuthManager>().isLoading,
            builder: (context, isLoading, child) {
              return isLoading
                  ? Container(
                      color: Colors.white70,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
