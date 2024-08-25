import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_minimalists/modules/home/counter/counter_store.dart';
import 'package:flutter_triple/flutter_triple.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final store = CounterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScopedConsumer<CounterStore, int>(
              store: store,
              onStateListener: (context, state) =>
                  log(state.toString()), //called when the state changes
              onErrorListener: (context, error) =>
                  log(error.toString()), //called when the error changes
              onLoadingListener: (context, isLoading) =>
                  log(isLoading.toString()), //called when the loading changes
              onStateBuilder: (context, state) =>
                  Text('$state'), //called when the state changes
              onErrorBuilder: (context, error) =>
                  Text('$error'), //called when the error changes
              onLoadingBuilder: (context) => const Center(
                  child:
                      CircularProgressIndicator()), //called when the loading changes
            ),
            ScopedBuilder<CounterStore, int>(
              store: store,
              onLoading: (context) =>
                  const Center(child: CircularProgressIndicator()),
              onError: (context, error) =>
                  Center(child: Text(error.toString())),
              onState: (context, state) {
                return Center(
                  child: Text(
                    '$state',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "decrement",
            onPressed: store.decrement,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 5),
          FloatingActionButton(
            heroTag: "increment",
            onPressed: store.increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    log("HelloText rebuild");
    return const Text("Hello");
  }
}
