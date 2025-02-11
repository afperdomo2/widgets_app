import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

final colorListProvider = Provider((ref) => colorList);

final isDarkModeProvider = StateProvider<bool>((ref) => false);
final selectedColorProvider = StateProvider<int>((ref) => 0);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColor(int index) {
    state = state.copyWith(selectedColor: index);
  }
}
