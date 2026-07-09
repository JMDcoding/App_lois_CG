import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_routes.dart';
import '../core/widgets/responsive_layout.dart';

class WebScaffold extends StatelessWidget {
  final Widget child;

  const WebScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _WebHeader(),
            Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 80,
              ),
              child: child,
            ),
            const WebFooter(),
          ],
        ),
      ),
    );
  }
}

class _WebHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                // Logo
                Image.asset('assets/images/logo/logo.jpeg', height: 40),
                const SizedBox(width: 16),
                Text(
                  'Mobeko',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: isDark ? AppColors.lightGreen : AppColors.forestGreen,
                  ),
                ),
                const Spacer(),
                // Navigation Links
                _NavLink('Accueil', AppRoutes.home),
                const SizedBox(width: 16),
                _NavLink('Cartes', AppRoutes.map),
                const SizedBox(width: 16),
                _NavLink('Bibliothèque', AppRoutes.library),
                const SizedBox(width: 16),
                _NavLink('Assistant', AppRoutes.chat),
                const SizedBox(width: 16),
                _NavLink('Profil', AppRoutes.profile),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String title;
  final String route;

  const _NavLink(this.title, this.route);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return InkWell(
      onTap: () => context.go(route),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.grey300 : AppColors.grey700,
        ),
      ),
    );
  }
}

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      color: isDark ? AppColors.darkCard : AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mobeko',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: isDark ? AppColors.lightGreen : AppColors.forestGreen,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Votre assistant juridique intelligent pour la République du Congo. La loi à portée de main.',
                          style: TextStyle(
                            color: isDark ? AppColors.grey400 : AppColors.grey600,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Liens Rapides', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 16),
                        _FooterLink('Accueil', AppRoutes.home),
                        _FooterLink('Bibliothèque', AppRoutes.library),
                        _FooterLink('Paramètres', AppRoutes.settings),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Légal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 16),
                        _FooterLink("Conditions d'utilisation", '#'),
                        _FooterLink('Politique de confidentialité', '#'),
                        _FooterLink('Contact', '#'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 20),
              Text(
                '© 2026 Mobeko. Tous droits réservés.',
                style: TextStyle(color: isDark ? AppColors.grey500 : AppColors.grey500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String title;
  final String route;

  const _FooterLink(this.title, this.route);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          if (route != '#') context.push(route);
        },
        child: Text(
          title,
          style: TextStyle(
            color: isDark ? AppColors.grey400 : AppColors.grey600,
          ),
        ),
      ),
    );
  }
}
