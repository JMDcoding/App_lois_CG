import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/widgets/category_card.dart';
import '../../../../core/widgets/responsive_layout.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../../web/web_scaffold.dart';
class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  static final _categories = [
    _Cat('Travail', Icons.work_outline_rounded, 'Droit du travail, contrats, licenciement'),
    _Cat('Famille', Icons.family_restroom_rounded, 'Mariage, divorce, filiation'),
    _Cat('Logement', Icons.home_work_outlined, 'Location, propriété, expulsion'),
    _Cat('Police', Icons.local_police_outlined, 'Contrôles, arrestations, garde à vue'),
    _Cat('Justice', Icons.gavel_rounded, 'Tribunaux, procédures, appel'),
    _Cat('Santé', Icons.health_and_safety_outlined, 'Droits des patients, assurance'),
    _Cat('Éducation', Icons.school_outlined, 'Scolarité, bourses, diplômes'),
    _Cat('Fiscalité', Icons.account_balance_outlined, 'Impôts, TVA, déclarations'),
    _Cat('Entreprises', Icons.business_center_outlined, 'Création, gestion, fermeture'),
    _Cat('Enfants', Icons.child_care_rounded, 'Protection, scolarité, adoption'),
    _Cat('Femmes', Icons.woman_rounded, 'Droits, protection, égalité'),
    _Cat('Consommateurs', Icons.shopping_bag_outlined, 'Achats, garanties, litiges'),
    _Cat('Successions', Icons.account_tree_outlined, 'Héritage, testament, partage'),
    _Cat('Propriété', Icons.real_estate_agent_outlined, 'Terrain, cadastre, bornage'),
    _Cat('Contrats', Icons.description_outlined, 'Rédaction, exécution, résiliation'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final scrollBody = CustomScrollView(
        shrinkWrap: kIsWeb,
        physics: kIsWeb ? const NeverScrollableScrollPhysics() : null,
        slivers: [
          if (!kIsWeb)
            SliverAppBar(
              floating: true,
              title: Text('Bibliothèque Juridique',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: isDark ? AppColors.white : AppColors.darkGreen,
                  )),
              actions: [
                IconButton(
                  onPressed: () => context.push(AppRoutes.search),
                  icon: const Icon(Icons.search_rounded),
                ),
              ],
            ),
          if (kIsWeb)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20, left: 16),
                child: Text(
                  'Bibliothèque Juridique',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.white : AppColors.darkGreen,
                  ),
                ),
              ),
            ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final cat = _categories[index];
                  return CategoryCard(
                    title: cat.name,
                    icon: cat.icon,
                    onTap: () => context.go(
                        '${AppRoutes.library}/category/${cat.name.toLowerCase()}'),
                  );
                },
                childCount: _categories.length,
              ),
            ),
          ),
        ],
      );

    if (kIsWeb) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: scrollBody,
        ),
      );
    }
    return Scaffold(body: scrollBody);
  }
}

class _Cat {
  final String name;
  final IconData icon;
  final String desc;
  const _Cat(this.name, this.icon, this.desc);
}
