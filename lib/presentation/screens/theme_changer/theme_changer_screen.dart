import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/providers/theme.riverpod.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = "theme_changer_screen";

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    // final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              // ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
            },
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorList = ref.watch(colorListProvider);
    final selectedColor = ref.watch(themeNotifierProvider).selectedColor;
    // final selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (context, index) {
        final color = colorList[index];
        return RadioListTile(
          title: Text("This color", style: TextStyle(color: color)),
          subtitle: Text("${color.value}"),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            ref.read(themeNotifierProvider.notifier).changeColor(index);
            // ref.read(selectedColorProvider.notifier).state = index;
          },
        );
      },
    );
  }
}
