import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarsScreen extends StatelessWidget {
  static const String name = 'snackbars_screen';

  const SnackbarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () => openAboutDialog(context),
              child: const Text("Licensias usadas - About dialog"),
            ),
            FilledButton(
              onPressed: () => openCustomDialog(context),
              child: const Text("Mostrar dialogo"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show Snackbar'),
        icon: const Icon(Icons.info),
        onPressed: () => showSnackbar(context),
      ),
    );
  }

  /// Abre un cuadro de diálogo "Acerca de" en el contexto dado.
  ///
  /// Esta función muestra un cuadro de diálogo con información sobre la aplicación.
  ///
  /// [context] El BuildContext en el cual se muestra el cuadro de diálogo.
  void openAboutDialog(BuildContext context) {
    return showAboutDialog(
      context: context,
      applicationName: 'Widgets App - Licencias usadas',
      children: const [
        Text(
          'Dolor ad aute mollit consectetur et. Ut consequat exercitation laborum laboris sit pariatur. Quis proident minim eiusmod enim incididunt sunt velit ipsum nisi dolor laborum irure ea fugiat. Lorem excepteur non et fugiat dolore voluptate eiusmod. Aliquip duis esse laboris mollit nulla ut cillum adipisicing aliqua eu qui dolore sint. Ullamco ullamco aliqua fugiat minim commodo est officia dolor magna ullamco et aliqua. Ut ut consectetur pariatur aliquip ad aliquip est.',
        ),
      ],
    );
  }

  /// Abre un cuadro de diálogo personalizado en el [context] dado.
  ///
  /// Esta función muestra un cuadro de diálogo personalizado con contenido
  /// y acciones específicas definidas dentro de la función.
  ///
  /// [context] es el BuildContext en el cual se muestra el cuadro de diálogo.
  /// Opens a custom dialog in the given [context].
  void openCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // No se puede cerrar con el botón de atrás
      builder: (context) => AlertDialog(
        title: const Text('Licencias usadas'),
        content: const Text(
          "Cillum velit officia quis reprehenderit ea aliquip dolor ex est ad officia eu incididunt. Laborum adipisicing irure ipsum ea adipisicing laborum sunt occaecat Lorem in ea irure in tempor. Aliqua ea duis commodo ullamco duis eiusmod est tempor sunt esse reprehenderit labore occaecat. Ad voluptate deserunt anim sint dolore nisi irure sit.",
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(), // Es lo mismo que Navigator.of(context).pop()
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  /// Muestra un snackbar en el [context] dado.
  ///
  /// Esta función muestra un snackbar con un mensaje y estilo predefinidos.
  ///
  /// [context] es el BuildContext en el cual se muestra el snackbar.
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
