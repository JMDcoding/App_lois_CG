import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

/// Service de notifications push via Firebase Cloud Messaging
class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  /// Initialise le service de notifications
  Future<void> init() async {
    // Demander la permission
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('Notifications autorisées');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      debugPrint('Notifications provisoires autorisées');
    } else {
      debugPrint('Notifications refusées');
    }

    // Obtenir le token FCM
    final token = await _messaging.getToken();
    debugPrint('FCM Token: $token');

    // Écouter les changements de token
    _messaging.onTokenRefresh.listen((newToken) {
      debugPrint('FCM Token rafraîchi: $newToken');
      // TODO: Sauvegarder le nouveau token dans Firestore
    });

    // Gérer les messages reçus en foreground
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Gérer les messages quand l'app est ouverte depuis une notification
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);
  }

  /// Obtient le token FCM actuel
  Future<String?> getToken() async {
    return await _messaging.getToken();
  }

  /// S'abonner à un topic
  Future<void> subscribeToTopic(String topic) async {
    await _messaging.subscribeToTopic(topic);
    debugPrint('Abonné au topic: $topic');
  }

  /// Se désabonner d'un topic
  Future<void> unsubscribeFromTopic(String topic) async {
    await _messaging.unsubscribeFromTopic(topic);
    debugPrint('Désabonné du topic: $topic');
  }

  /// Abonnements par défaut
  Future<void> subscribeToDefaultTopics() async {
    await subscribeToTopic('news');        // Actualités
    await subscribeToTopic('new_laws');     // Nouvelles lois
    await subscribeToTopic('general');      // Notifications générales
  }

  void _handleForegroundMessage(RemoteMessage message) {
    debugPrint('Message reçu en foreground: ${message.notification?.title}');
    // TODO: Afficher une notification locale ou un snackbar
  }

  void _handleMessageOpenedApp(RemoteMessage message) {
    debugPrint('App ouverte depuis notification: ${message.data}');
    // TODO: Naviguer vers l'écran approprié
  }
}

/// Handler pour les messages reçus en background (doit être top-level)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Message reçu en background: ${message.messageId}');
}
