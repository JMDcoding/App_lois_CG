import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class EmergencyDetailScreen extends StatelessWidget {
  final String scenarioId;
  const EmergencyDetailScreen({super.key, required this.scenarioId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(scenarioId.substring(0, 1).toUpperCase() + scenarioId.substring(1))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Section(title: 'âš–ï¸ Vos droits', items: [
              'Vous avez le droit de connaÃ®tre les raisons',
              'Vous pouvez contacter un avocat',
              'Vous pouvez prÃ©venir votre famille',
              'Toute violence est interdite',
            ]),
            _Section(title: 'ðŸš¨ Actions immÃ©diates', items: [
              'Restez calme et coopÃ©rez',
              'Notez les noms et matricules',
              'Contactez un proche',
              'Ne signez rien sans comprendre',
            ]),
            _Section(title: 'ðŸ“ž NumÃ©ros utiles', items: [
              'Police: 117',
              'Urgences: 112',
              'Barreau de Brazzaville',
              'Commission des droits de l\'homme',
            ]),
            _Section(title: 'ðŸ“‹ ProcÃ©dure', items: [
              'Ã‰tape 1: Restez calme',
              'Ã‰tape 2: Demandez Ã  voir l\'officier',
              'Ã‰tape 3: Exigez un PV',
              'Ã‰tape 4: Contactez un avocat sous 24h',
            ]),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: AppColors.paleGreen.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'âš ï¸ En cas de danger immÃ©diat, appelez le 117 (Police) ou le 112 (Urgences).',
                style: TextStyle(fontWeight: FontWeight.w600, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List<String> items;
  const _Section({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('â€¢ ', style: TextStyle(fontSize: 16, color: AppColors.forestGreen)),
                Expanded(child: Text(item, style: const TextStyle(fontSize: 14, height: 1.4))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
