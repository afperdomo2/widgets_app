import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Botones"),
      ),
      body: const _ButtonsView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Ocupa todo el ancho posible
      child: Padding(
        padding: const EdgeInsets.all(10), // Agrega un padding de 10 a todos los lados
        child: Wrap(
          spacing: 6, // Espacio entre los botones
          alignment: WrapAlignment.center, // Centra los botones
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Elevated")),
            const ElevatedButton(onPressed: null, child: Text("Elevated Disabled")),
            ElevatedButton.icon(onPressed: () {}, label: const Text("Elevated Icon"), icon: const Icon(Icons.alarm)),
            FilledButton(onPressed: () {}, child: const Text("Filled")),
            FilledButton.icon(onPressed: () {}, label: const Text("Filled Icon"), icon: const Icon(Icons.dangerous)),
            OutlinedButton(onPressed: () {}, child: const Text("Outlined")),
            OutlinedButton.icon(onPressed: () {}, label: const Text("Outlined Icon"), icon: const Icon(Icons.terminal)),
            TextButton(onPressed: () {}, child: const Text("Text")),
            TextButton.icon(onPressed: () {}, label: const Text("Text Icon"), icon: const Icon(Icons.comment)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add_a_photo)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_a_photo),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.orange[600]),
                iconColor: WidgetStateProperty.all(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
