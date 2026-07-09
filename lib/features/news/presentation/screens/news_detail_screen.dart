import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class NewsDetailScreen extends StatelessWidget {
  final String newsId;
  const NewsDetailScreen({super.key, required this.newsId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.paleGreen,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text('Nouvelle loi', style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.forestGreen)),
            ),
            const SizedBox(height: 12),
            const Text('Titre de l\'actualité juridique',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, height: 1.2)),
            const SizedBox(height: 8),
            Text('Publié le 7 juillet 2026', style: TextStyle(fontSize: 13, color: AppColors.grey500)),
            const SizedBox(height: 20),
            Text(
              'Contenu détaillé de l\'actualité juridique.\n\n'
              'Cette nouvelle loi vise à renforcer les droits des citoyens congolais '
              'dans le domaine concerné. Les principales dispositions comprennent...\n\n'
              'Article 1: ...\nArticle 2: ...\nArticle 3: ...',
              style: const TextStyle(fontSize: 15, height: 1.7),
            ),
          ],
        ),
      ),
    );
  }
}
