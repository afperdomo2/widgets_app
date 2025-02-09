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

  Future<void> refreshImages() async {
    await Future.delayed(const Duration(seconds: 2));
    final ramdomId = Random().nextInt(50); // ID aleatorio
    imagesIds.clear(); // Limpiar la lista
    imagesIds.add(ramdomId + 1); // Agregar el ID aleatorio
    loadMoreImages(4); // Cargar 4 imágenes
    setState(() {});
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    loadMoreImages();
    setState(() => isLoading = false);
  }

  void loadMoreImages([int amount = 5]) {
    final lastImageId = imagesIds.last;
    imagesIds.addAll(List.generate(amount, (index) => lastImageId + index + 1));
    if (amount > 0) setState(() {}); // Actualizar la UI
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
      floatingActionButton: _FloatingActionButtons(scrollController: scrollController),
    );
  }
}

class _FloatingActionButtons extends StatelessWidget {
  const _FloatingActionButtons({
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: 'scrollToTop',
          onPressed: () => scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          ),
          child: const Icon(Icons.arrow_upward),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          heroTag: 'loadMoreImages',
          onPressed: () => context.pop(),
          child: const Icon(Icons.arrow_back),
        )
      ],
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
