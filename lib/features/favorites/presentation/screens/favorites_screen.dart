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
              Tab(text: 'Réponses IA'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MobekoEmptyWidget(
              message: 'Aucun article sauvegardé',
              subtitle: 'Appuyez sur â¤ï¸ pour sauvegarder un article',
              icon: Icons.bookmark_outline_rounded,
            ),
            MobekoEmptyWidget(
              message: 'Aucun document sauvegardé',
              subtitle: 'Vos documents générés apparaîtront ici',
              icon: Icons.description_outlined,
            ),
            MobekoEmptyWidget(
              message: 'Aucune réponse sauvegardée',
              subtitle: 'Sauvegardez les réponses utiles de l\'assistant',
              icon: Icons.smart_toy_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
