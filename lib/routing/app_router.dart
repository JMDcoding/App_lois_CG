import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/constants/app_routes.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/phone_auth_screen.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/library/presentation/screens/library_screen.dart';
import '../features/library/presentation/screens/category_screen.dart';
import '../features/library/presentation/screens/article_detail_screen.dart';
import '../features/chat/presentation/screens/chat_screen.dart';
import '../features/map/presentation/screens/map_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../features/profile/presentation/screens/settings_screen.dart';
import '../features/search/presentation/screens/search_screen.dart';
import '../features/procedures/presentation/screens/procedures_list_screen.dart';
import '../features/procedures/presentation/screens/procedure_detail_screen.dart';
import '../features/documents/presentation/screens/document_generator_screen.dart';
import '../features/documents/presentation/screens/document_form_screen.dart';
import '../features/documents/presentation/screens/scan_screen.dart';
import '../features/emergency/presentation/screens/emergency_screen.dart';
import '../features/emergency/presentation/screens/emergency_detail_screen.dart';
import '../features/news/presentation/screens/news_list_screen.dart';
import '../features/news/presentation/screens/news_detail_screen.dart';
import '../features/favorites/presentation/screens/favorites_screen.dart';
import '../features/admin/presentation/screens/admin_dashboard_screen.dart';
import '../core/widgets/app_scaffold.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

/// Configuration du routeur GoRouter
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isOnboarding = state.matchedLocation == AppRoutes.onboarding;

      // Pas de redirection si onboarding
      if (isOnboarding) return null;

      // Pas besoin d'ÃƒÂªtre connectÃƒÂ© pour utiliser l'app (connexion anonyme)
      // La redirection est optionnelle
      return null;
    },
    routes: [
      // Onboarding
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),

      // Auth routes
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.phoneAuth,
        builder: (context, state) => const PhoneAuthScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      // Main shell with bottom navigation
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => AppScaffold(child: child),
        routes: [
          // Home tab
          GoRoute(
            path: AppRoutes.home,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
          ),

          // Library tab
          GoRoute(
            path: AppRoutes.library,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: LibraryScreen(),
            ),
            routes: [
              GoRoute(
                path: AppRoutes.category,
                builder: (context, state) => CategoryScreen(
                  categoryId: state.pathParameters['categoryId']!,
                ),
              ),
              GoRoute(
                path: AppRoutes.article,
                builder: (context, state) => ArticleDetailScreen(
                  articleId: state.pathParameters['articleId']!,
                ),
              ),
            ],
          ),

          // Chat tab
          GoRoute(
            path: AppRoutes.chat,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ChatScreen(),
            ),
          ),

          // Map tab
          GoRoute(
            path: AppRoutes.map,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: MapScreen(),
            ),
          ),

          // Profile tab
          GoRoute(
            path: AppRoutes.profile,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
        ],
      ),

      // Full screen routes (outside bottom nav)
      GoRoute(
        path: AppRoutes.search,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: AppRoutes.procedures,
        builder: (context, state) => const ProceduresListScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.procedureDetail,
            builder: (context, state) => ProcedureDetailScreen(
              procedureId: state.pathParameters['procedureId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.documents,
        builder: (context, state) => const DocumentGeneratorScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.documentForm,
            builder: (context, state) => DocumentFormScreen(
              templateId: state.pathParameters['templateId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.scan,
        builder: (context, state) => const ScanScreen(),
      ),
      GoRoute(
        path: AppRoutes.emergency,
        builder: (context, state) => const EmergencyScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.emergencyDetail,
            builder: (context, state) => EmergencyDetailScreen(
              scenarioId: state.pathParameters['scenarioId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.news,
        builder: (context, state) => const NewsListScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.newsDetail,
            builder: (context, state) => NewsDetailScreen(
              newsId: state.pathParameters['newsId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.favorites,
        builder: (context, state) => const FavoritesScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.admin,
        builder: (context, state) => const AdminDashboardScreen(),
      ),
    ],
  );
});
