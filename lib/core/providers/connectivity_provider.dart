import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_providers.dart';

/// Provider pour l'état de connectivité en temps réel
final connectivityStreamProvider = StreamProvider<bool>((ref) {
  final service = ref.watch(connectivityServiceProvider);
  return service.onConnectivityChanged;
});

/// Provider pour vérifier la connectivité actuelle
final isConnectedProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(connectivityServiceProvider);
  return await service.isConnected;
});
