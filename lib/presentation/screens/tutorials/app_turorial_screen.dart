import 'package:animate_do/animate_do.dart';
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

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final pageController = PageController();
  bool endReached = false; // Variable para saber si se ha llegado al final de los slides

  /// Inicializa el estado del widget.
  ///
  /// Este método se llama cuando se crea el objeto de estado. Se utiliza para
  /// realizar cualquier configuración o inicialización necesaria para el widget.
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final page = pageController.page ?? 0;
      //
      // De 0.0 a 0.4 Primer slide
      // De 0.5 a 1.4 Segundo slide
      // De 1.5 a 2.0 Tercer slide
      //
      if (page >= 1.5) {
        setState(() => endReached = true);
      } else {
        setState(() => endReached = false);
      }
    });
  }

  /// Libera los recursos utilizados por la pantalla.
  ///
  /// Este método se llama cuando la pantalla se elimina del árbol de widgets
  /// permanentemente. Sobrescribe este método para liberar cualquier recurso
  /// que se haya asignado en el `initState` u otros métodos del ciclo de vida.
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
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
          Positioned(
            bottom: 10,
            left: 20,
            child: Text('$endReached'),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 400),
                    child: FilledButton(
                      onPressed: () => setState(() {
                        pageController.jumpToPage(0);
                        endReached = false;
                      }),
                      child: const Text("Comenzar"),
                    ),
                  ),
                )
              : const SizedBox()
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
