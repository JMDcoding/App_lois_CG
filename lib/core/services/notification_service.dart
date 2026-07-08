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
      debugPrint('Notifications autorisÃ©es');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      debugPrint('Notifications provisoires autorisÃ©es');
    } else {
      debugPrint('Notifications refusÃ©es');
    }

    // Obtenir le token FCM
    final token = await _messaging.getToken();
    debugPrint('FCM Token: $token');

    // Ã‰couter les changements de token
    _messaging.onTokenRefresh.listen((newToken) {
      debugPrint('FCM Token rafraÃ®chi: $newToken');
      // TODO: Sauvegarder le nouveau token dans Firestore
    });

    // GÃ©rer les messages reÃ§us en foreground
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // GÃ©rer les messages quand l'app est ouverte depuis une notification
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);
  }

  /// Obtient le token FCM actuel
  Future<String?> getToken() async {
    return await _messaging.getToken();
  }

  /// S'abonner Ã  un topic
  Future<void> subscribeToTopic(String topic) async {
    await _messaging.subscribeToTopic(topic);
    debugPrint('AbonnÃ© au topic: $topic');
  }

  /// Se dÃ©sabonner d'un topic
  Future<void> unsubscribeFromTopic(String topic) async {
    await _messaging.unsubscribeFromTopic(topic);
    debugPrint('DÃ©sabonnÃ© du topic: $topic');
  }

  /// Abonnements par dÃ©faut
  Future<void> subscribeToDefaultTopics() async {
    await subscribeToTopic('news');        // ActualitÃ©s
    await subscribeToTopic('new_laws');     // Nouvelles lois
    await subscribeToTopic('general');      // Notifications gÃ©nÃ©rales
  }

  void _handleForegroundMessage(RemoteMessage message) {
    debugPrint('Message reÃ§u en foreground: ${message.notification?.title}');
    // TODO: Afficher une notification locale ou un snackbar
  }

  void _handleMessageOpenedApp(RemoteMessage message) {
    debugPrint('App ouverte depuis notification: ${message.data}');
    // TODO: Naviguer vers l'Ã©cran appropriÃ©
  }
}

/// Handler pour les messages reÃ§us en background (doit Ãªtre top-level)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Message reÃ§u en background: ${message.messageId}');
}
