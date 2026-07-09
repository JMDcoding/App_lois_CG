import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Administration')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats
            Row(
              children: [
                Expanded(child: _StatCard(title: 'Utilisateurs', value: '1,245', icon: Icons.people_rounded, color: AppColors.forestGreen)),
                const SizedBox(width: 12),
                Expanded(child: _StatCard(title: 'Messages IA', value: '8,392', icon: Icons.chat_rounded, color: AppColors.info)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _StatCard(title: 'Articles', value: '156', icon: Icons.article_rounded, color: AppColors.mediumGreen)),
                const SizedBox(width: 12),
                Expanded(child: _StatCard(title: 'Documents', value: '432', icon: Icons.description_rounded, color: AppColors.warning)),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Gestion', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            _AdminTile(title: 'Utilisateurs', subtitle: 'Gérer les comptes', icon: Icons.people_outlined, onTap: () {}),
            _AdminTile(title: 'Contenu juridique', subtitle: 'Publier lois et articles', icon: Icons.article_outlined, onTap: () {}),
            _AdminTile(title: 'Actualités', subtitle: 'Publier des actualités', icon: Icons.newspaper_rounded, onTap: () {}),
            _AdminTile(title: 'FAQ', subtitle: 'Gérer les questions fréquentes', icon: Icons.help_outline_rounded, onTap: () {}),
            _AdminTile(title: 'Catégories', subtitle: 'Gérer les catégories', icon: Icons.category_outlined, onTap: () {}),
            _AdminTile(title: 'Notifications', subtitle: 'Envoyer des notifications push', icon: Icons.notifications_outlined, onTap: () {}),
            _AdminTile(title: 'Statistiques', subtitle: 'Voir les statistiques détaillées', icon: Icons.analytics_outlined, onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title; final String value; final IconData icon; final Color color;
  const _StatCard({required this.title, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 12),
            Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: color)),
            Text(title, style: TextStyle(fontSize: 12, color: AppColors.grey500)),
          ],
        ),
      ),
    );
  }
}

class _AdminTile extends StatelessWidget {
  final String title; final String subtitle; final IconData icon; final VoidCallback onTap;
  const _AdminTile({required this.title, required this.subtitle, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: AppColors.forestGreen),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 12, color: AppColors.grey500)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
        onTap: onTap,
      ),
    );
  }
}
