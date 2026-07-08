import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

/// Service de dÃ©tection de la connectivitÃ© rÃ©seau
/// Permet de gÃ©rer le mode hors ligne
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  
  /// Stream des changements de connectivitÃ©
  Stream<bool> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged.map((results) {
      return results.any((result) => result != ConnectivityResult.none);
    });
  }

  /// VÃ©rifie si l'appareil est connectÃ©
  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return results.any((result) => result != ConnectivityResult.none);
  }

  /// VÃ©rifie si l'appareil est connectÃ© via WiFi
  Future<bool> get isOnWifi async {
    final results = await _connectivity.checkConnectivity();
    return results.any((result) => result == ConnectivityResult.wifi);
  }

  /// VÃ©rifie si l'appareil est connectÃ© via donnÃ©es mobiles
  Future<bool> get isOnMobile async {
    final results = await _connectivity.checkConnectivity();
    return results.any((result) => result == ConnectivityResult.mobile);
  }
}
