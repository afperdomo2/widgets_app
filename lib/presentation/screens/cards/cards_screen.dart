import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {"elevation": 0.0, "title": "Elevation 0"},
  {"elevation": 1.0, "title": "Elevation 1"},
  {"elevation": 2.0, "title": "Elevation 2"},
  {"elevation": 3.0, "title": "Elevation 3"},
  {"elevation": 4.0, "title": "Elevation 4"},
  {"elevation": 5.0, "title": "Elevation 5"},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) => _CardType1(card: card)),
          ...cards.map((card) => _CardType2(card: card)),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  const _CardType1({required this.card});

  final Map<String, dynamic> card;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: card['elevation'],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(card['title']),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  const _CardType2({required this.card});

  final Map<String, dynamic> card;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.blue, width: 2),
      ),
      elevation: card['elevation'],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(card['title'] + ' - Outlined'),
            ),
          ],
        ),
      ),
    );
  }
}
