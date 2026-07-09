import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';

class ProceduresListScreen extends StatelessWidget {
  const ProceduresListScreen({super.key});

  static final _procedures = [
    _Proc('Carte nationale d\'identité', Icons.badge_outlined, '15 000 FCFA', '30 jours'),
    _Proc('Passeport', Icons.flight_outlined, '50 000 FCFA', '45 jours'),
    _Proc('Permis de conduire', Icons.drive_eta_outlined, '25 000 FCFA', '21 jours'),
    _Proc('Acte de naissance', Icons.child_friendly_outlined, '5 000 FCFA', '7 jours'),
    _Proc('Acte de mariage', Icons.favorite_outlined, '10 000 FCFA', '14 jours'),
    _Proc('Acte de décès', Icons.description_outlined, '5 000 FCFA', '7 jours'),
    _Proc('Succession', Icons.account_tree_outlined, 'Variable', '90 jours'),
    _Proc('Création d\'entreprise', Icons.business_outlined, '100 000 FCFA', '15 jours'),
    _Proc('Casier judiciaire', Icons.gavel_outlined, '10 000 FCFA', '7 jours'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Démarches Administratives')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _procedures.length,
        itemBuilder: (context, index) {
          final p = _procedures[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(14),
              leading: Container(
                width: 44, height: 44,
                decoration: BoxDecoration(
                  color: AppColors.forestGreen.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(p.icon, color: AppColors.forestGreen, size: 22),
              ),
              title: Text(p.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    _InfoChip(icon: Icons.payments_outlined, text: p.cost),
                    const SizedBox(width: 8),
                    _InfoChip(icon: Icons.schedule_rounded, text: p.delay),
                  ],
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
              onTap: () => context.push('${AppRoutes.procedures}/detail/$index'),
            ),
          );
        },
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.paleGreen.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: AppColors.forestGreen),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _Proc {
  final String title; final IconData icon; final String cost; final String delay;
  const _Proc(this.title, this.icon, this.cost, this.delay);
}
