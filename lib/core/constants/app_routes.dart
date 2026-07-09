/// Constantes de routes pour la navigation GoRouter
class AppRoutes {
  AppRoutes._();

  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
  // Routes principales
  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

  static const String splash = '/splash';
  static const String onboarding = '/onboarding';

  // Auth
  static const String login = '/login';
  static const String register = '/register';
  static const String phoneAuth = '/phone-auth';
  static const String forgotPassword = '/forgot-password';

  // Main shell (bottom nav)
  static const String home = '/';
  static const String library = '/library';
  static const String chat = '/chat';
  static const String map = '/map';
  static const String profile = '/profile';

  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
  // Routes imbriquées
  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

  // Library
  static const String category = 'category/:categoryId';
  static const String article = 'article/:articleId';

  // Home
  static const String search = '/search';
  static const String notifications = '/notifications';

  // Procedures
  static const String procedures = '/procedures';
  static const String procedureDetail = 'detail/:procedureId';

  // Documents
  static const String documents = '/documents';
  static const String documentForm = 'form/:templateId';
  static const String documentPreview = 'preview';
  static const String scan = '/scan';

  // Emergency
  static const String emergency = '/emergency';
  static const String emergencyDetail = 'detail/:scenarioId';

  // News
  static const String news = '/news';
  static const String newsDetail = 'detail/:newsId';

  // Favorites
  static const String favorites = '/favorites';

  // Profile
  static const String settings = '/settings';
  static const String history = '/history';
  static const String downloads = '/downloads';

  // Admin
  static const String admin = '/admin';
  static const String adminUsers = '/admin/users';
  static const String adminContent = '/admin/content';
  static const String adminStats = '/admin/stats';
}
