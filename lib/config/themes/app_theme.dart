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

  /// Crea una copia de este [AppTheme] pero con los campos dados reemplazados con los nuevos valores.
  ///
  /// Este método te permite crear una nueva instancia de [AppTheme] con algunas propiedades
  /// modificadas mientras mantienes el resto de las propiedades sin cambios.
  ///
  /// Los parámetros son opcionales y si no se proporcionan, se usarán las propiedades
  /// correspondientes de la instancia actual.
  ///
  /// Devuelve una nueva instancia de [AppTheme] con las propiedades actualizadas.
  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode,
  }) {
    return AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
