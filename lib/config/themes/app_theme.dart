import 'package:flutter/material.dart';

const List<Color> colorList = [
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
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  })  : assert(selectedColor >= 0, 'selectedColor must be greater than or equal to 0'),
        assert(selectedColor < colorList.length, 'selectedColor must be less than ${colorList.length}');

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: colorList[selectedColor],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: colorList[selectedColor].withOpacity(0.6),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
    );
  }
}
