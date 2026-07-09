import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ArticleDetailScreen extends StatelessWidget {
  final String articleId;
  const ArticleDetailScreen({super.key, required this.articleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Article Juridique'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Titre de l\'article', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            _buildTab(context, 'Résumé', Icons.summarize_outlined,
                'Ce texte résume les points essentiels de cet article de loi.'),
            _buildTab(context, 'Explication simple', Icons.lightbulb_outline_rounded,
                'Voici une explication en termes simples de ce que cette loi signifie pour vous.'),
            _buildTab(context, 'Exemples', Icons.format_list_bulleted_rounded,
                'â€¢ Exemple 1: Situation concrète\nâ€¢ Exemple 2: Cas pratique'),
            _buildTab(context, 'Articles de loi', Icons.article_outlined,
                'Article 123 du Code Civil : "Le texte exact de l\'article..."'),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(BuildContext context, String title, IconData icon, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        leading: Icon(icon, color: AppColors.forestGreen),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        initiallyExpanded: title == 'Résumé',
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(content, style: TextStyle(height: 1.6, color: AppColors.grey600)),
          ),
        ],
      ),
    );
  }
}
