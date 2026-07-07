import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        children: [
          _SettingsSection(title: 'Général', children: [
            SwitchListTile(value: true, onChanged: (_) {},
                title: const Text('Notifications'), secondary: const Icon(Icons.notifications_outlined)),
            ListTile(leading: const Icon(Icons.language_rounded),
                title: const Text('Langue'), subtitle: const Text('Français'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14), onTap: () {}),
            ListTile(leading: const Icon(Icons.dark_mode_rounded),
                title: const Text('Thème'), subtitle: const Text('Système'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14), onTap: () {}),
          ]),
          _SettingsSection(title: 'Données', children: [
            SwitchListTile(value: true, onChanged: (_) {},
                title: const Text('Mode hors ligne'), secondary: const Icon(Icons.cloud_off_outlined)),
            ListTile(leading: const Icon(Icons.delete_outline_rounded),
                title: const Text('Vider le cache'), onTap: () {}),
          ]),
          _SettingsSection(title: 'Légal', children: [
            ListTile(leading: const Icon(Icons.privacy_tip_outlined),
                title: const Text('Politique de confidentialité'), onTap: () {}),
            ListTile(leading: const Icon(Icons.description_outlined),
                title: const Text('Conditions d\'utilisation'), onTap: () {}),
            ListTile(leading: const Icon(Icons.info_outline_rounded),
                title: const Text('À propos de Mobeko'),
                subtitle: const Text('Version 1.0.0'), onTap: () {}),
          ]),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SettingsSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700,
              color: AppColors.forestGreen, letterSpacing: 0.5)),
        ),
        ...children,
      ],
    );
  }
}
