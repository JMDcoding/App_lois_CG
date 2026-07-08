import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  static final _scenarios = [
    _Scenario('Arrestation', Icons.front_hand_rounded, AppColors.emergency,
        'Vous Ãªtes arrÃªtÃ© ou un proche est arrÃªtÃ©'),
    _Scenario('Violence', Icons.warning_rounded, const Color(0xFFE76F51),
        'Vous Ãªtes victime de violence physique ou morale'),
    _Scenario('Expulsion', Icons.home_rounded, const Color(0xFFE9C46A),
        'Vous Ãªtes menacÃ© d\'expulsion de votre logement'),
    _Scenario('Accident', Icons.car_crash_rounded, const Color(0xFF457B9D),
        'Vous avez eu un accident de la route'),
    _Scenario('Arnaque', Icons.report_gmailerrorred_rounded, const Color(0xFFF4A261),
        'Vous Ãªtes victime d\'une arnaque ou escroquerie'),
    _Scenario('Litige foncier', Icons.terrain_rounded, const Color(0xFF2A9D8F),
        'Conflit sur la propriÃ©tÃ© d\'un terrain'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Urgence Juridique'),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.close_rounded),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: AppColors.emergencyGradient,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(Icons.emergency_rounded, color: AppColors.white, size: 32),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Besoin d\'aide immÃ©diate ?',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,
                              color: AppColors.white)),
                      SizedBox(height: 4),
                      Text('SÃ©lectionnez votre situation ci-dessous',
                          style: TextStyle(fontSize: 13, color: Colors.white70)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _scenarios.length,
              itemBuilder: (context, index) {
                final s = _scenarios[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      width: 48, height: 48,
                      decoration: BoxDecoration(
                        color: s.color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(s.icon, color: s.color, size: 24),
                    ),
                    title: Text(s.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(s.desc, style: TextStyle(fontSize: 12, color: AppColors.grey500)),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
                    onTap: () => context.push('${AppRoutes.emergency}/detail/${s.title.toLowerCase()}'),
                  ),
                );
              },
            ),
          ),
          // Emergency numbers
          Container(
            padding: EdgeInsets.fromLTRB(16, 12, 16, MediaQuery.of(context).padding.bottom + 12),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCard : AppColors.grey50,
              border: Border(top: BorderSide(color: isDark ? AppColors.darkElevated : AppColors.grey200)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _EmergencyNumber(number: '117', label: 'Police'),
                _EmergencyNumber(number: '118', label: 'Pompiers'),
                _EmergencyNumber(number: '112', label: 'Urgences'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmergencyNumber extends StatelessWidget {
  final String number;
  final String label;
  const _EmergencyNumber({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48, height: 48,
          decoration: BoxDecoration(
            color: AppColors.emergency.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(number, style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.emergency)),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 11, color: AppColors.grey500)),
      ],
    );
  }
}

class _Scenario {
  final String title;
  final IconData icon;
  final Color color;
  final String desc;
  const _Scenario(this.title, this.icon, this.color, this.desc);
}
