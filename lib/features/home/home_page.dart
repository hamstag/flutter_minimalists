import 'package:flutter/material.dart';
import 'package:flutter_minimalists/features/home/home_manager.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_minimalists/features/auth/auth_service.dart';
import 'package:flutter_minimalists/features/auth/auth_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          children: [
            const Text('This is home page'),
            const FirstNameText(),
            ElevatedButton(
              onPressed: () async {
                Modular.get<HomeManager>().updateFirstName();
              },
              child: const Text('Update'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Modular.get<AuthService>().logout();
                await Modular.get<AuthStore>().clear();
                Modular.to.navigate('/auth/login');
              },
              child: const Text('Logout'),
            ),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/counter'),
              child: const Text('Counter Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstNameText extends StatelessWidget {
  const FirstNameText({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<AuthStore>((bind) => bind.model);
    return Text(store.model.value?.firstName ?? "");
  }
}
