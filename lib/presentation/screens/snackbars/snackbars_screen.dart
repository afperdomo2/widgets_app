import 'package:flutter/material.dart';

class SnackbarsScreen extends StatelessWidget {
  static const String name = 'snackbars_screen';

  const SnackbarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show Snackbar'),
        icon: const Icon(Icons.info),
        onPressed: () => showSnackbar(context),
      ),
    );
  }

  void showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars(); // Limpia todos los snackbars previos
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('This is a snackbar'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(label: 'Action', onPressed: () => {}),
      ),
    );
  }
}
