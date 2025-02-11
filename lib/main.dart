import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/themes/app_theme.dart';
import 'package:widgets_app/providers/theme.riverpod.dart';

void main() {
  runApp(
    /// ProviderScope: Un widget que proporciona un ámbito para los providers.
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isDarkMode = ref.watch(isDarkModeProvider);
    // final selectedColor = ref.watch(selectedColorProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Widgets App',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.theme(),
      // theme: AppTheme(selectedColor: selectedColor, isDarkMode: isDarkMode).theme(),
    );
  }
}
