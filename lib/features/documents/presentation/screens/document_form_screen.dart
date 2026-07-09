import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/animated_button.dart';

class DocumentFormScreen extends StatelessWidget {
  final String templateId;
  const DocumentFormScreen({super.key, required this.templateId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Créer un document')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Remplissez les informations', style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text('Les champs marqués * sont obligatoires',
                style: TextStyle(fontSize: 13, color: AppColors.grey500)),
            const SizedBox(height: 24),
            _buildField('Nom complet *'),
            _buildField('Adresse *'),
            _buildField('Ville *'),
            _buildField('Téléphone'),
            _buildField('Objet du document *'),
            _buildField('Description détaillée *', maxLines: 5),
            _buildField('Destinataire *'),
            _buildField('Adresse du destinataire'),
            const SizedBox(height: 32),
            AnimatedButton(
              text: 'Générer le PDF',
              icon: Icons.picture_as_pdf_rounded,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Document PDF généré avec succès !')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: maxLines > 1,
        ),
      ),
    );
  }
}
