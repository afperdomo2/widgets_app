import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/providers/counter.riverpod.dart';
import 'package:widgets_app/providers/theme.riverpod.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    // final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Counter"),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              // ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
            },
          )
        ],
      ),
      body: Center(
        child: Text("Valor: $clickCounter", style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
          // ref.read(counterProvider.notifier).update((value) => value + 1); // Alternativa para incrementar el valor
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
