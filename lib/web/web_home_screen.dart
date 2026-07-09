import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_routes.dart';
import 'web_scaffold.dart'; // Pour utiliser _WebFooter

class WebHomeScreen extends StatelessWidget {
  const WebHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HeroSection(),
        _FeaturesSection(),
      ],
    );
  }
}

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.paleGreen.withOpacity(0.3),
        border: Border(
          bottom: BorderSide(color: isDark ? AppColors.darkElevated : AppColors.grey200),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'La loi congolaise\nà portée de main.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 56,
                        fontWeight: FontWeight.w900,
                        height: 1.1,
                        letterSpacing: -1,
                        color: isDark ? AppColors.white : AppColors.darkGreen,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Mobeko est votre assistant juridique intelligent pour la République du Congo. Naviguez facilement dans les textes de loi, effectuez vos démarches et obtenez des réponses claires en français, lingala, kituba et anglais.',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.6,
                        color: isDark ? AppColors.grey300 : AppColors.grey700,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () => context.push(AppRoutes.library),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.forestGreen,
                            foregroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          child: const Text('Explorer les textes de loi'),
                        ),
                        const SizedBox(width: 16),
                        OutlinedButton(
                          onPressed: () => context.push(AppRoutes.chat),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: isDark ? AppColors.lightGreen : AppColors.forestGreen,
                            side: BorderSide(color: isDark ? AppColors.lightGreen : AppColors.forestGreen),
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          child: const Text('Poser une question'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 80),
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/images/logo/logo.jpeg', // Fallback
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeaturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const Text(
                'Nos Services',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  _FeatureCard(
                    title: 'Bibliothèque Juridique',
                    description: 'Consultez les codes, lois et décrets classés par catégories (Travail, Famille, Logement...).',
                    icon: Icons.menu_book_rounded,
                    onTap: () => context.push(AppRoutes.library),
                  ),
                  _FeatureCard(
                    title: 'Assistant IA',
                    description: 'Posez vos questions en langage naturel et obtenez des réponses basées sur les lois congolaises.',
                    icon: Icons.smart_toy_rounded,
                    onTap: () => context.push(AppRoutes.chat),
                  ),
                  _FeatureCard(
                    title: 'Démarches',
                    description: 'Des guides étape par étape pour créer une entreprise, obtenir un passeport, etc.',
                    icon: Icons.assignment_rounded,
                    onTap: () => context.push(AppRoutes.procedures),
                  ),
                  _FeatureCard(
                    title: 'Générateur de Documents',
                    description: 'Créez automatiquement des contrats, lettres de mise en demeure et autres documents légaux.',
                    icon: Icons.description_rounded,
                    onTap: () => context.push(AppRoutes.documents),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isDark ? AppColors.darkElevated : AppColors.grey200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.forestGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.forestGreen, size: 32),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(
                height: 1.5,
                color: isDark ? AppColors.grey400 : AppColors.grey600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
