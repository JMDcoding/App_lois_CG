import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/widgets/search_bar_widget.dart';
import '../../../../core/widgets/category_card.dart';
import '../../../../core/widgets/responsive_layout.dart';
import '../../../../core/providers/firebase_providers.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Écran d'accueil principal Mobeko
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showNewLawsPopup();
    });
  }

  Future<void> _showNewLawsPopup() async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeen = prefs.getBool('has_seen_new_laws_popup') ?? false;

    if (hasSeen) return;
    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Nouvelles Lois en Vigueur 🇨🇬'),
        content: const Text(
          'De nouvelles lois ont été promulguées. Vous pouvez les consulter directement sur le site officiel.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              prefs.setBool('has_seen_new_laws_popup', true);
              Navigator.pop(context);
            },
            child: const Text('Fermer'),
          ),
          ElevatedButton(
            onPressed: () {
              prefs.setBool('has_seen_new_laws_popup', true);
              Navigator.pop(context);
              _launchMinistryUrl();
            },
            child: const Text('Consulter'),
          ),
        ],
      ),
    );
  }

  Future<void> _launchMinistryUrl() async {
    final url = Uri.parse('https://sgg.cg/');
    if (!await launchUrl(url)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Impossible d\'ouvrir le lien')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      body: SafeArea(
        child: ResponsiveMaxWidth(
          child: CustomScrollView(
            slivers: [
            // Header avec message de bienvenue
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user?.displayName != null
                                  ? 'Bonjour, ${user!.displayName} ðŸ‘‹'
                                  : 'Bienvenue sur Mobeko ðŸ‘‹',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: isDark ? AppColors.white : AppColors.darkGreen,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'La loi à portée de main',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                color: AppColors.grey500,
                              ),
                            ),
                          ],
                        ),
                        // Notification bell
                        IconButton(
                          onPressed: () => context.push(AppRoutes.notifications),
                          icon: Badge(
                            smallSize: 8,
                            backgroundColor: AppColors.emergency,
                            child: Icon(
                              Icons.notifications_outlined,
                              color: isDark ? AppColors.grey300 : AppColors.grey700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Barre de recherche
                    MobekoSearchBar(
                      hintText: 'Rechercher une loi, un droit...',
                      readOnly: true,
                      onTap: () => context.push(AppRoutes.search),
                    ),
                  ],
                ),
              ),
            ),

            // Accès rapide urgence
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                child: _EmergencyBanner(
                  onTap: () => context.push(AppRoutes.emergency),
                ),
              ),
            ),

            // Catégories
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
                child: _SectionHeader(
                  title: 'Catégories',
                  onSeeAll: () => context.go(AppRoutes.library),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildCategoryChip(context, 'Travail', Icons.work_outline_rounded),
                    _buildCategoryChip(context, 'Famille', Icons.family_restroom_rounded),
                    _buildCategoryChip(context, 'Logement', Icons.home_work_outlined),
                    _buildCategoryChip(context, 'Police', Icons.local_police_outlined),
                    _buildCategoryChip(context, 'Justice', Icons.gavel_rounded),
                    _buildCategoryChip(context, 'Santé', Icons.health_and_safety_outlined),
                    _buildCategoryChip(context, 'Éducation', Icons.school_outlined),
                    _buildCategoryChip(context, 'Fiscalité', Icons.account_balance_outlined),
                    _buildCategoryChip(context, 'Entreprises', Icons.business_center_outlined),
                  ],
                ),
              ),
            ),

            // Services rapides
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: _SectionHeader(title: 'Services'),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: _ServiceCard(
                        title: 'Démarches',
                        subtitle: 'Guides étape par étape',
                        icon: Icons.checklist_rounded,
                        color: AppColors.mediumGreen,
                        onTap: () => context.push(AppRoutes.procedures),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _ServiceCard(
                        title: 'Documents',
                        subtitle: 'Créer automatiquement',
                        icon: Icons.description_outlined,
                        color: AppColors.info,
                        onTap: () => context.push(AppRoutes.documents),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: _ServiceCard(
                        title: 'Scanner',
                        subtitle: 'Analyser un document',
                        icon: Icons.document_scanner_outlined,
                        color: AppColors.warning,
                        onTap: () => context.push(AppRoutes.scan),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _ServiceCard(
                        title: 'Actualités',
                        subtitle: 'Nouvelles lois',
                        icon: Icons.newspaper_rounded,
                        color: AppColors.forestGreen,
                        onTap: () => _launchMinistryUrl(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Questions fréquentes
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 12),
                child: _SectionHeader(title: 'Questions fréquentes'),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _FaqTile(
                      question: 'Quels sont mes droits si la police m\'arrête ?',
                      answer: 'Vous avez le droit de connaître les raisons de votre arrestation, '
                          'de contacter un avocat et de prévenir votre famille. '
                          'Consultez la section Police pour plus de détails.',
                    ),
                    _FaqTile(
                      question: 'Comment créer une entreprise au Congo ?',
                      answer: 'La création d\'une entreprise nécessite l\'enregistrement au RCCM, '
                          'l\'obtention d\'un NIF et plusieurs documents. '
                          'Consultez notre guide Démarches pour les étapes complètes.',
                    ),
                    _FaqTile(
                      question: 'Quels documents pour un passeport ?',
                      answer: 'Vous aurez besoin d\'une CNI, 4 photos, un extrait de naissance, '
                          'et le formulaire de demande. Consultez la section Démarches.',
                    ),
                  ],
                ),
              ),
            ),

            // Disclaimer
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.darkCard
                        : AppColors.paleGreen.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDark ? AppColors.darkElevated : AppColors.mintGreen,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline_rounded,
                          size: 20, color: AppColors.forestGreen),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Mobeko fournit des informations juridiques à titre informatif. '
                          'Pour un conseil personnalisé, consultez un avocat.',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: isDark ? AppColors.grey400 : AppColors.grey700,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 80)),
          ],
        ),
      )),
    );
  }

  Widget _buildCategoryChip(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: CategoryCard(
        title: title,
        icon: icon,
        isCompact: true,
        onTap: () => context.go('${AppRoutes.library}/category/${title.toLowerCase()}'),
      ),
    );
  }
}

class _EmergencyBanner extends StatelessWidget {
  final VoidCallback onTap;
  const _EmergencyBanner({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: AppColors.emergencyGradient,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.emergency.withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.emergency_rounded,
                    color: AppColors.white, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Urgence Juridique',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      'Besoin d\'aide immédiate ? Appuyez ici.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: AppColors.white.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded,
                  color: AppColors.white, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;
  const _SectionHeader({required this.title, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
        if (onSeeAll != null)
          TextButton(
            onPressed: onSeeAll,
            child: const Text('Voir tout'),
          ),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ServiceCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: isDark ? AppColors.darkCard : AppColors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isDark ? AppColors.darkElevated : AppColors.grey200,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11,
                  color: AppColors.grey500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FaqTile extends StatelessWidget {
  final String question;
  final String answer;
  const _FaqTile({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        expandedAlignment: Alignment.topLeft,
        children: [
          Text(
            answer,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              height: 1.5,
              color: AppColors.grey600,
            ),
          ),
        ],
      ),
    );
  }
}
