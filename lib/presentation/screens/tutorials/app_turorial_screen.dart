import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String description;
  final String imageUrl;

  SlideInfo({required this.title, required this.description, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
    title: "Encuentra tus platos favoritos",
    description: "Nuestra aplicación te permite buscar entre una amplia variedad de platos",
    imageUrl: "assets/images/1.png",
  ),
  SlideInfo(
    title: "Entrega rápida",
    description: "Entrega rápida en tu puerta en menos de 30 minutos. ¡No esperes más!",
    imageUrl: "assets/images/2.png",
  ),
  SlideInfo(
    title: "Disfruta tu comida",
    description: "Disfruta de tu comida favorita en la comodidad de tu hogar o en cualquier lugar",
    imageUrl: "assets/images/3.png",
  ),
];

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            children: slides.map((slide) => _CustomSlide(slide)).toList(),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text("Salir"),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomSlide extends StatelessWidget {
  final SlideInfo slide;

  const _CustomSlide(this.slide);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleLarge;
    final descriptionStyle = theme.textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(slide.imageUrl),
            const SizedBox(height: 20),
            Text(slide.title, style: titleStyle),
            const SizedBox(height: 10),
            Text(slide.description, style: descriptionStyle),
          ],
        ),
      ),
    );
  }
}
