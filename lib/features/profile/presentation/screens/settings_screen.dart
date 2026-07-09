import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../core/widgets/responsive_layout.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);
    
    String themeString = 'Système';
    if (themeMode == ThemeMode.light) themeString = 'Clair';
    if (themeMode == ThemeMode.dark) themeString = 'Sombre';
    
    String languageString = 'Français 🇫🇷';
    if (locale.languageCode == 'en') languageString = 'English 🇬🇧';
    if (locale.languageCode == 'ln') languageString = 'Lingala 🇨🇩';
    if (locale.languageCode == 'kg') languageString = 'Kituba 🇨🇬';
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ResponsiveMaxWidth(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _SettingsSection(title: 'Général', children: [
              SwitchListTile(value: true, onChanged: (_) {},
                  title: const Text('Notifications'), secondary: const Icon(Icons.notifications_outlined)),
              ListTile(leading: const Icon(Icons.language_rounded),
                  title: const Text('Langue'), subtitle: Text(languageString),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14), 
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Choisir la langue'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(title: const Text('Français 🇫🇷'), onTap: () { ref.read(localeProvider.notifier).setLocale('fr'); Navigator.pop(context); }),
                            ListTile(title: const Text('English 🇬🇧'), onTap: () { ref.read(localeProvider.notifier).setLocale('en'); Navigator.pop(context); }),
                            ListTile(title: const Text('Lingala 🇨🇩'), onTap: () { ref.read(localeProvider.notifier).setLocale('ln'); Navigator.pop(context); }),
                            ListTile(title: const Text('Kituba 🇨🇬'), onTap: () { ref.read(localeProvider.notifier).setLocale('kg'); Navigator.pop(context); }),
                          ],
                        ),
                      ),
                    );
                  }),
              ListTile(leading: const Icon(Icons.dark_mode_rounded),
                  title: const Text('Thème'), subtitle: Text(themeString),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14), 
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Choisir le thème'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(title: const Text('Système'), onTap: () { ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.system); Navigator.pop(context); }),
                            ListTile(title: const Text('Clair'), onTap: () { ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.light); Navigator.pop(context); }),
                            ListTile(title: const Text('Sombre'), onTap: () { ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.dark); Navigator.pop(context); }),
                          ],
                        ),
                      ),
                    );
                  }),
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
              const SizedBox(height: 20),
              Center(
                child: Text('Mobeko © 2026', style: TextStyle(color: AppColors.grey500)),
              ),
            ]),
          ],
        ),
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
