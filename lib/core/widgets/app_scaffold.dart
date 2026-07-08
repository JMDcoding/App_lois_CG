import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';
import '../constants/app_routes.dart';

/// Scaffold principal avec Bottom Navigation Bar Material 3
/// Contient les 5 onglets : Accueil, BibliothÃ¨que, Assistant, Carte, Profil
class AppScaffold extends StatelessWidget {
  final Widget child;

  const AppScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: _BottomNavBar(),
      floatingActionButton: _EmergencyFab(context),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return NavigationBar(
      selectedIndex: _calculateSelectedIndex(context),
      onDestinationSelected: (index) => _onItemTapped(index, context),
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.home_outlined,
              color: isDark ? AppColors.grey500 : AppColors.grey600),
          selectedIcon: Icon(Icons.home_rounded,
              color: isDark ? AppColors.lightGreen : AppColors.forestGreen),
          label: 'Accueil',
        ),
        NavigationDestination(
          icon: Icon(Icons.menu_book_outlined,
              color: isDark ? AppColors.grey500 : AppColors.grey600),
          selectedIcon: Icon(Icons.menu_book_rounded,
              color: isDark ? AppColors.lightGreen : AppColors.forestGreen),
          label: 'BibliothÃ¨que',
        ),
        NavigationDestination(
          icon: Icon(Icons.smart_toy_outlined,
              color: isDark ? AppColors.grey500 : AppColors.grey600),
          selectedIcon: Icon(Icons.smart_toy_rounded,
              color: isDark ? AppColors.lightGreen : AppColors.forestGreen),
          label: 'Assistant',
        ),
        NavigationDestination(
          icon: Icon(Icons.map_outlined,
              color: isDark ? AppColors.grey500 : AppColors.grey600),
          selectedIcon: Icon(Icons.map_rounded,
              color: isDark ? AppColors.lightGreen : AppColors.forestGreen),
          label: 'Carte',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline_rounded,
              color: isDark ? AppColors.grey500 : AppColors.grey600),
          selectedIcon: Icon(Icons.person_rounded,
              color: isDark ? AppColors.lightGreen : AppColors.forestGreen),
          label: 'Profil',
        ),
      ],
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(AppRoutes.library)) return 1;
    if (location.startsWith(AppRoutes.chat)) return 2;
    if (location.startsWith(AppRoutes.map)) return 3;
    if (location.startsWith(AppRoutes.profile)) return 4;
    return 0; // Home
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(AppRoutes.home);
        break;
      case 1:
        context.go(AppRoutes.library);
        break;
      case 2:
        context.go(AppRoutes.chat);
        break;
      case 3:
        context.go(AppRoutes.map);
        break;
      case 4:
        context.go(AppRoutes.profile);
        break;
    }
  }
}

class _EmergencyFab extends StatelessWidget {
  final BuildContext context;

  const _EmergencyFab(this.context);

  @override
  Widget build(BuildContext context) {
    // Ne pas afficher le FAB sur l'Ã©cran d'urgence
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(AppRoutes.emergency)) return const SizedBox.shrink();

    return FloatingActionButton(
      onPressed: () => context.push(AppRoutes.emergency),
      backgroundColor: AppColors.emergency,
      heroTag: 'emergency_fab',
      tooltip: 'Urgence juridique',
      child: const Icon(
        Icons.emergency_rounded,
        color: AppColors.white,
        size: 28,
      ),
    );
  }
}
