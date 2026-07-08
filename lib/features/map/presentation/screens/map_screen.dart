import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text('Carte Interactive',
            style: TextStyle(fontWeight: FontWeight.w700,
                color: isDark ? AppColors.white : AppColors.darkGreen)),
      ),
      body: Column(
        children: [
          // Category filters
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _FilterChip(label: 'Tous', selected: true),
                _FilterChip(label: 'Tribunaux'),
                _FilterChip(label: 'Commissariats'),
                _FilterChip(label: 'Mairies'),
                _FilterChip(label: 'Notaires'),
                _FilterChip(label: 'Avocats'),
                _FilterChip(label: 'HÃ´pitaux'),
              ],
            ),
          ),
          // Map placeholder
          Expanded(
            child: Container(
              color: isDark ? AppColors.darkCard : AppColors.grey100,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.map_rounded, size: 64,
                        color: isDark ? AppColors.grey600 : AppColors.grey400),
                    const SizedBox(height: 16),
                    Text('Carte Google Maps',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,
                            color: isDark ? AppColors.grey400 : AppColors.grey600)),
                    const SizedBox(height: 8),
                    Text('Configurez votre clÃ© API Google Maps\npour activer la carte.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: AppColors.grey500)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _FilterChip({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) {},
        selectedColor: AppColors.forestGreen,
        labelStyle: TextStyle(
          color: selected ? AppColors.white : null,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }
}
