import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_providers.dart';

/// Provider pour l'Ã©tat de connectivitÃ© en temps rÃ©el
final connectivityStreamProvider = StreamProvider<bool>((ref) {
  final service = ref.watch(connectivityServiceProvider);
  return service.onConnectivityChanged;
});

/// Provider pour vÃ©rifier la connectivitÃ© actuelle
final isConnectedProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(connectivityServiceProvider);
  return await service.isConnected;
});
