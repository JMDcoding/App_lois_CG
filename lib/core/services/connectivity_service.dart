import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

/// Service de détection de la connectivité réseau
/// Permet de gérer le mode hors ligne
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  
  /// Stream des changements de connectivité
  Stream<bool> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged.map((results) {
      return results.any((result) => result != ConnectivityResult.none);
    });
  }

  /// Vérifie si l'appareil est connecté
  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return results.any((result) => result != ConnectivityResult.none);
  }

  /// Vérifie si l'appareil est connecté via WiFi
  Future<bool> get isOnWifi async {
    final results = await _connectivity.checkConnectivity();
    return results.any((result) => result == ConnectivityResult.wifi);
  }

  /// Vérifie si l'appareil est connecté via données mobiles
  Future<bool> get isOnMobile async {
    final results = await _connectivity.checkConnectivity();
    return results.any((result) => result == ConnectivityResult.mobile);
  }
}
