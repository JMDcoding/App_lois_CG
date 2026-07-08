import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scanner un document')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120, height: 120,
                decoration: BoxDecoration(
                  color: AppColors.forestGreen.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.document_scanner_rounded,
                    size: 56, color: AppColors.forestGreen),
              ),
              const SizedBox(height: 24),
              const Text('Scanner un document', style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              Text('Prenez une photo de votre document.\nL\'IA analysera le contenu automatiquement.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.grey500, height: 1.5)),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt_rounded),
                label: const Text('Prendre une photo'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.photo_library_rounded),
                label: const Text('Choisir depuis la galerie'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
