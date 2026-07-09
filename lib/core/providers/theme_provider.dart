import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Notifier pour gérer le mode sombre et le sauvegarder dans Hive
class ThemeModeNotifier extends Notifier<ThemeMode> {
  static const _themeKey = 'app_theme_mode';
  late final Box _settingsBox;

  @override
  ThemeMode build() {
    _settingsBox = Hive.box('settings');
    return _loadTheme();
  }

  ThemeMode _loadTheme() {
    final savedTheme = _settingsBox.get(_themeKey) as String?;
    if (savedTheme == 'light') return ThemeMode.light;
    if (savedTheme == 'dark') return ThemeMode.dark;
    return ThemeMode.system;
  }

  void setThemeMode(ThemeMode mode) {
    state = mode;
    String themeString = 'system';
    if (mode == ThemeMode.light) themeString = 'light';
    if (mode == ThemeMode.dark) themeString = 'dark';
    _settingsBox.put(_themeKey, themeString);
  }
}

/// Provider pour le mode thème
final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(() {
  return ThemeModeNotifier();
});
