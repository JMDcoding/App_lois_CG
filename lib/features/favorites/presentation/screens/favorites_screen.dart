import 'package:flutter/material.dart';
import '../../../../core/widgets/error_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favoris'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Articles'),
              Tab(text: 'Documents'),
              Tab(text: 'RÃ©ponses IA'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MobekoEmptyWidget(
              message: 'Aucun article sauvegardÃ©',
              subtitle: 'Appuyez sur â¤ï¸ pour sauvegarder un article',
              icon: Icons.bookmark_outline_rounded,
            ),
            MobekoEmptyWidget(
              message: 'Aucun document sauvegardÃ©',
              subtitle: 'Vos documents gÃ©nÃ©rÃ©s apparaÃ®tront ici',
              icon: Icons.description_outlined,
            ),
            MobekoEmptyWidget(
              message: 'Aucune rÃ©ponse sauvegardÃ©e',
              subtitle: 'Sauvegardez les rÃ©ponses utiles de l\'assistant',
              icon: Icons.smart_toy_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
