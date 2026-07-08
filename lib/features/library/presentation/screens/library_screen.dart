import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/widgets/category_card.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  static final _categories = [
    _Cat('Travail', Icons.work_outline_rounded, 'Droit du travail, contrats, licenciement'),
    _Cat('Famille', Icons.family_restroom_rounded, 'Mariage, divorce, filiation'),
    _Cat('Logement', Icons.home_work_outlined, 'Location, propriÃ©tÃ©, expulsion'),
    _Cat('Police', Icons.local_police_outlined, 'ContrÃ´les, arrestations, garde Ã  vue'),
    _Cat('Justice', Icons.gavel_rounded, 'Tribunaux, procÃ©dures, appel'),
    _Cat('SantÃ©', Icons.health_and_safety_outlined, 'Droits des patients, assurance'),
    _Cat('Ã‰ducation', Icons.school_outlined, 'ScolaritÃ©, bourses, diplÃ´mes'),
    _Cat('FiscalitÃ©', Icons.account_balance_outlined, 'ImpÃ´ts, TVA, dÃ©clarations'),
    _Cat('Entreprises', Icons.business_center_outlined, 'CrÃ©ation, gestion, fermeture'),
    _Cat('Enfants', Icons.child_care_rounded, 'Protection, scolaritÃ©, adoption'),
    _Cat('Femmes', Icons.woman_rounded, 'Droits, protection, Ã©galitÃ©'),
    _Cat('Consommateurs', Icons.shopping_bag_outlined, 'Achats, garanties, litiges'),
    _Cat('Successions', Icons.account_tree_outlined, 'HÃ©ritage, testament, partage'),
    _Cat('PropriÃ©tÃ©', Icons.real_estate_agent_outlined, 'Terrain, cadastre, bornage'),
    _Cat('Contrats', Icons.description_outlined, 'RÃ©daction, exÃ©cution, rÃ©siliation'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Text('BibliothÃ¨que Juridique',
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
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
    );
  }
}

class _Cat {
  final String name;
  final IconData icon;
  final String desc;
  const _Cat(this.name, this.icon, this.desc);
}
