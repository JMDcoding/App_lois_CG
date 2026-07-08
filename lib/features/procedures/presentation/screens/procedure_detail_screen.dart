import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ProcedureDetailScreen extends StatelessWidget {
  final String procedureId;
  const ProcedureDetailScreen({super.key, required this.procedureId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guide de dÃ©marche')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Documents requis', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            _CheckItem('Carte nationale d\'identitÃ©'),
            _CheckItem('4 photos d\'identitÃ©'),
            _CheckItem('Extrait de naissance'),
            _CheckItem('Justificatif de domicile'),
            _CheckItem('Formulaire de demande rempli'),
            const SizedBox(height: 24),
            const Text('Ã‰tapes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            _StepItem(1, 'Rassembler les documents', 'PrÃ©parez tous les documents listÃ©s ci-dessus.'),
            _StepItem(2, 'Se rendre au bureau compÃ©tent', 'Allez Ã  la prÃ©fecture ou sous-prÃ©fecture de votre localitÃ©.'),
            _StepItem(3, 'DÃ©poser le dossier', 'Remettez votre dossier complet au guichet.'),
            _StepItem(4, 'Payer les frais', 'RÃ©glez les frais requis et conservez le reÃ§u.'),
            _StepItem(5, 'Retirer le document', 'Revenez Ã  la date indiquÃ©e avec votre reÃ§u.'),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.paleGreen.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('ðŸ’¡ Conseils', style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text('â€¢ Faites des copies de tous vos documents\n'
                      'â€¢ Arrivez tÃ´t pour Ã©viter la file d\'attente\n'
                      'â€¢ VÃ©rifiez les horaires d\'ouverture',
                      style: TextStyle(fontSize: 13, height: 1.6, color: AppColors.grey700)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CheckItem extends StatefulWidget {
  final String text;
  const _CheckItem(this.text);

  @override
  State<_CheckItem> createState() => _CheckItemState();
}

class _CheckItemState extends State<_CheckItem> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _checked,
      onChanged: (v) => setState(() => _checked = v!),
      title: Text(widget.text, style: TextStyle(
        fontSize: 14,
        decoration: _checked ? TextDecoration.lineThrough : null,
        color: _checked ? AppColors.grey400 : null,
      )),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: AppColors.forestGreen,
      contentPadding: EdgeInsets.zero,
    );
  }
}

class _StepItem extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  const _StepItem(this.number, this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32, height: 32,
            decoration: BoxDecoration(
              color: AppColors.forestGreen, shape: BoxShape.circle,
            ),
            child: Center(
              child: Text('$number', style: const TextStyle(
                  color: AppColors.white, fontWeight: FontWeight.w700, fontSize: 14)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(description, style: TextStyle(fontSize: 13, color: AppColors.grey600, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
