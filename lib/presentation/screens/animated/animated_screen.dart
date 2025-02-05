import 'package:flutter/material.dart';
import "dart:math";

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.blue;
  double borderRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contenedor animado"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600), // Duración de la animación
          curve: Curves.bounceOut, // Animación de entrada y salida
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _changeProperties(),
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  void _changeProperties() {
    setState(() {
      width = Random().nextInt(300).toDouble();
      height = Random().nextInt(300).toDouble();
      borderRadius = Random().nextInt(100).toDouble();
      color = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1,
      );
    });
  }
}
