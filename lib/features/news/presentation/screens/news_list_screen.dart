import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Actualités Juridiques')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 140,
                    width: double.infinity,
                    color: AppColors.forestGreen.withOpacity(0.1),
                    child: Center(
                      child: Icon(Icons.newspaper_rounded, size: 40,
                          color: AppColors.forestGreen.withOpacity(0.4)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.paleGreen,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text('Nouvelle loi', style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.forestGreen)),
                        ),
                        const SizedBox(height: 8),
                        Text('Actualité juridique n°${index + 1}',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text('Description de l\'actualité juridique concernant une nouvelle loi ou réforme.',
                            style: TextStyle(fontSize: 13, color: AppColors.grey600, height: 1.4)),
                        const SizedBox(height: 8),
                        Text('Il y a ${index + 1} jours',
                            style: TextStyle(fontSize: 11, color: AppColors.grey400)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
