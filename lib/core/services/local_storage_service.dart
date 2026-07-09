import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/// Service de stockage local utilisant Hive et SharedPreferences
/// Hive pour les données structurées, SharedPreferences pour les préférences simples
class LocalStorageService {
  static const String _settingsBox = 'settings';
  static const String _cacheBox = 'cache';
  static const String _favoritesBox = 'favorites';
  static const String _offlineBox = 'offline_data';
  static const String _historyBox = 'history';

  late SharedPreferences _prefs;

  /// Initialise le service de stockage
  Future<void> init() async {
    await Hive.initFlutter();
    await Future.wait([
      Hive.openBox(_settingsBox),
      Hive.openBox(_cacheBox),
      Hive.openBox(_favoritesBox),
      Hive.openBox(_offlineBox),
      Hive.openBox(_historyBox),
    ]);
    _prefs = await SharedPreferences.getInstance();
  }

  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
  // Settings (SharedPreferences)
  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

  /// Langue sélectionnée
  String get language => _prefs.getString('language') ?? 'fr';
  Future<void> setLanguage(String lang) => _prefs.setString('language', lang);

  /// Mode thème (system, light, dark)
  String get themeMode => _prefs.getString('theme_mode') ?? 'system';
  Future<void> setThemeMode(String mode) => _prefs.setString('theme_mode', mode);

  /// Première ouverture (onboarding)
  bool get isFirstLaunch => _prefs.getBool('first_launch') ?? true;
  Future<void> setFirstLaunchCompleted() => _prefs.setBool('first_launch', false);

  /// Notifications activées
  bool get notificationsEnabled => _prefs.getBool('notifications') ?? true;
  Future<void> setNotificationsEnabled(bool enabled) =>
      _prefs.setBool('notifications', enabled);

  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
  // Cache (Hive)
  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

  /// Sauvegarde des données en cache avec expiration
  Future<void> cacheData(String key, dynamic data, {Duration? expiry}) async {
    final box = Hive.box(_cacheBox);
    final entry = {
      'data': jsonEncode(data),
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'expiry': expiry?.inMilliseconds,
    };
    await box.put(key, entry);
  }

  /// Récupère des données du cache
  dynamic getCachedData(String key) {
    final box = Hive.box(_cacheBox);
    final entry = box.get(key);
    if (entry == null) return null;

    final map = Map<String, dynamic>.from(entry);
    final timestamp = map['timestamp'] as int;
    final expiry = map['expiry'] as int?;

    // Vérifier l'expiration
    if (expiry != null) {
      final expiryTime = DateTime.fromMillisecondsSinceEpoch(timestamp + expiry);
      if (DateTime.now().isAfter(expiryTime)) {
        box.delete(key);
        return null;
      }
    }

    return jsonDecode(map['data'] as String);
  }

  /// Supprime une entrée du cache
  Future<void> removeCachedData(String key) async {
    final box = Hive.box(_cacheBox);
    await box.delete(key);
  }

  /// Vide tout le cache
  Future<void> clearCache() async {
    final box = Hive.box(_cacheBox);
    await box.clear();
  }

  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
  // Favoris (Hive)
  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

  /// Ajoute un favori
  Future<void> addFavorite(String type, Map<String, dynamic> item) async {
    final box = Hive.box(_favoritesBox);
    final favorites = List<Map>.from(box.get(type, defaultValue: []));
    favorites.add({...item, 'savedAt': DateTime.now().toIso8601String()});
    await box.put(type, favorites);
  }

  /// Récupère les favoris par type
  List<Map<String, dynamic>> getFavorites(String type) {
    final box = Hive.box(_favoritesBox);
    final favorites = box.get(type, defaultValue: []);
    return List<Map<String, dynamic>>.from(
      (favorites as List).map((e) => Map<String, dynamic>.from(e)),
    );
  }

  /// Supprime un favori
  Future<void> removeFavorite(String type, String id) async {
    final box = Hive.box(_favoritesBox);
    final favorites = List<Map>.from(box.get(type, defaultValue: []));
    favorites.removeWhere((item) => item['id'] == id);
    await box.put(type, favorites);
  }

  /// Vérifie si un élément est en favori
  bool isFavorite(String type, String id) {
    final favorites = getFavorites(type);
    return favorites.any((item) => item['id'] == id);
  }

  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
  // Données hors ligne (Hive)
  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

  /// Sauvegarde des données pour accès hors ligne
  Future<void> saveOfflineData(String key, dynamic data) async {
    final box = Hive.box(_offlineBox);
    await box.put(key, jsonEncode(data));
  }

  /// Récupère des données hors ligne
  dynamic getOfflineData(String key) {
    final box = Hive.box(_offlineBox);
    final data = box.get(key);
    if (data == null) return null;
    return jsonDecode(data as String);
  }

  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
  // Historique (Hive)
  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

  /// Ajoute une entrée à l'historique
  Future<void> addToHistory(String type, Map<String, dynamic> entry) async {
    final box = Hive.box(_historyBox);
    final history = List<Map>.from(box.get(type, defaultValue: []));
    history.insert(0, {...entry, 'timestamp': DateTime.now().toIso8601String()});
    // Garder les 100 dernières entrées
    if (history.length > 100) history.removeLast();
    await box.put(type, history);
  }

  /// Récupère l'historique
  List<Map<String, dynamic>> getHistory(String type) {
    final box = Hive.box(_historyBox);
    final history = box.get(type, defaultValue: []);
    return List<Map<String, dynamic>>.from(
      (history as List).map((e) => Map<String, dynamic>.from(e)),
    );
  }

  /// Vide l'historique
  Future<void> clearHistory(String type) async {
    final box = Hive.box(_historyBox);
    await box.delete(type);
  }
}
