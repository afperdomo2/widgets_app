import 'package:flutter/material.dart';

const List<Color> _colors = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.amber,
  Colors.indigo,
  Colors.cyan,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'selectedColor must be greater than or equal to 0'),
        assert(selectedColor < _colors.length, 'selectedColor must be less than ${_colors.length}');

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colors[selectedColor],
      appBarTheme: AppBarTheme(backgroundColor: _colors[selectedColor].withOpacity(0.4)),
    );
  }
}
