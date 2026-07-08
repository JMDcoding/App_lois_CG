import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Notifier pour gérer la langue et la sauvegarder dans Hive
class LocaleNotifier extends Notifier<Locale> {
  static const _localeKey = 'app_locale';
  late final Box _settingsBox;

  @override
  Locale build() {
    _settingsBox = Hive.box('settings');
    return _loadLocale();
  }

  Locale _loadLocale() {
    final savedLocale = _settingsBox.get(_localeKey) as String?;
    if (savedLocale != null) {
      return Locale(savedLocale);
    }
    return const Locale('fr'); // Français par défaut
  }

  void setLocale(String languageCode) {
    state = Locale(languageCode);
    _settingsBox.put(_localeKey, languageCode);
  }
}

/// Provider pour la langue
final localeProvider = NotifierProvider<LocaleNotifier, Locale>(() {
  return LocaleNotifier();
});
