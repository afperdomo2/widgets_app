import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import "dart:math";

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController scrollController = ScrollController();

  List<int> imagesIds = List.generate(5, (index) => Random().nextInt(50) + index);
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      final pixels = scrollController.position.pixels;
      final maxScrollExtent = scrollController.position.maxScrollExtent;
      final isEndOfList = pixels + 500 >= maxScrollExtent;
      if (isEndOfList) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  /// Refresca la lista de imágenes obteniendo nuevos datos.
  Future<void> refreshImages() async {
    await Future.delayed(const Duration(seconds: 2));
    final ramdomId = Random().nextInt(50); // ID aleatorio
    imagesIds.clear(); // Limpiar la lista
    imagesIds.add(ramdomId + 1); // Agregar el ID aleatorio
    loadMoreImages(4); // Cargar 4 imágenes
    setState(() {});
  }

  /// Carga la siguiente página de datos de forma asíncrona.
  Future<void> loadNextPage() async {
    if (isLoading) return;
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    loadMoreImages();
    setState(() => isLoading = false);
    moveSrollToBottom();
  }

  /// Carga más imágenes en la vista de desplazamiento.
  ///
  /// Este método obtiene una cantidad especificada de imágenes adicionales y las agrega
  /// a la lista actual de imágenes. El número predeterminado de imágenes a cargar
  /// es 5 si no se especifica ninguna cantidad.
  ///
  /// [amount] La cantidad de imágenes a cargar. Por defecto es 5 si no se proporciona.
  void loadMoreImages([int amount = 5]) {
    final lastImageId = imagesIds.last;
    imagesIds.addAll(List.generate(amount, (index) => lastImageId + index + 1));
    if (amount > 0) setState(() {}); // Actualizar la UI
  }

  /// Mueve la posición del scroll al final del widget desplazable (Si el scroll está cerca del final).
  /// Este método se puede usar para desplazarse programáticamente hasta el final de la lista o contenido.
  void moveSrollToBottom() {
    // isNearBottom: Indica si el scroll está cerca del final
    final isNearBottom = scrollController.position.pixels + 150 < scrollController.position.maxScrollExtent;
    if (isNearBottom) return;
    // targetScrollPosition: Posición final del scroll (más 150 pixeles para mostrar el último elemento)
    final targetScrollPosition = scrollController.position.maxScrollExtent + 150;
    scrollController.animateTo(
      targetScrollPosition,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  /// Mueve la posición del scroll al inicio del widget desplazable.
  void moveSrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('${imagesIds.length} images loaded'),
      // ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MediaQuery.removePadding(
            context: context,
            removeTop: true, // Remover el padding del SafeArea
            child: RefreshIndicator(
              onRefresh: refreshImages,
              strokeWidth: 2, // Grosor del indicador
              edgeOffset: 10, // Distancia del borde para activar el refresh
              child: ListView.builder(
                controller: scrollController,
                itemCount: imagesIds.length,
                physics: const BouncingScrollPhysics(), // Efecto de rebote
                itemBuilder: (context, index) {
                  return FadeInImage(
                    fit: BoxFit.cover,
                    width: double.infinity, // Ocupar todo el ancho
                    height: 300,
                    placeholder: const AssetImage("assets/images/jar-loading.gif"),
                    image: NetworkImage("https://picsum.photos/id/${imagesIds[index]}/500/300"),
                  );
                },
              ),
            ),
          ),
          if (isLoading) const _AlertLoadingImages(),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'scrollToTop',
            onPressed: moveSrollToTop,
            child: const Icon(Icons.arrow_upward),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'loadMoreImages',
            onPressed: () => context.pop(),
            child: const Icon(Icons.arrow_back),
          )
        ],
      ),
    );
  }
}

class _AlertLoadingImages extends StatelessWidget {
  const _AlertLoadingImages();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: Colors.black54,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 10),
              Text("Loading images...", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
