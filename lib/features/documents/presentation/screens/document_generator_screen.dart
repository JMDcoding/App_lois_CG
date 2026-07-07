import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';

class DocumentGeneratorScreen extends StatelessWidget {
  const DocumentGeneratorScreen({super.key});

  static final _templates = [
    _Tmpl('Plainte', Icons.report_outlined, 'Déposer une plainte officielle'),
    _Tmpl('Mise en demeure', Icons.warning_amber_rounded, 'Mettre en demeure une partie'),
    _Tmpl('Contrat simple', Icons.handshake_outlined, 'Rédiger un contrat de base'),
    _Tmpl('Procuration', Icons.how_to_vote_outlined, 'Déléguer un pouvoir'),
    _Tmpl('Lettre administrative', Icons.mail_outlined, 'Correspondance officielle'),
    _Tmpl('Déclaration', Icons.edit_document, 'Faire une déclaration écrite'),
    _Tmpl('Demande officielle', Icons.request_page_outlined, 'Formuler une demande'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Générateur de documents')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: AppColors.accentGradient,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(Icons.auto_awesome_rounded, color: AppColors.white, size: 28),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Créez vos documents', style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.white)),
                      Text('Remplissez un formulaire, obtenez un PDF', style: TextStyle(
                          fontSize: 12, color: Colors.white70)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(_templates.length, (i) {
            final t = _templates[i];
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: Container(
                  width: 44, height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.forestGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(t.icon, color: AppColors.forestGreen),
                ),
                title: Text(t.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text(t.desc, style: TextStyle(fontSize: 12, color: AppColors.grey500)),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
                onTap: () => context.push('${AppRoutes.documents}/form/$i'),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _Tmpl {
  final String name; final IconData icon; final String desc;
  const _Tmpl(this.name, this.icon, this.desc);
}
