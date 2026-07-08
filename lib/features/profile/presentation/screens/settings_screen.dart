import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../../../core/providers/locale_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);
    
    String themeString = 'SystÃ¨me';
    if (themeMode == ThemeMode.light) themeString = 'Clair';
    if (themeMode == ThemeMode.dark) themeString = 'Sombre';
    
    String languageString = 'FranÃ§ais ðŸ‡«ðŸ‡·';
    if (locale.languageCode == 'en') languageString = 'English ðŸ‡¬ðŸ‡§';
    if (locale.languageCode == 'ln') languageString = 'Lingala ðŸ‡¨ðŸ‡©';
    if (locale.languageCode == 'kg') languageString = 'Kituba ðŸ‡¨ðŸ‡¬';
    return Scaffold(
      appBar: AppBar(title: const Text('ParamÃ¨tres')),
      body: ListView(
        children: [
          _SettingsSection(title: 'GÃ©nÃ©ral', children: [
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
                          ListTile(title: const Text('FranÃ§ais ðŸ‡«ðŸ‡·'), onTap: () { ref.read(localeProvider.notifier).setLocale('fr'); Navigator.pop(context); }),
                          ListTile(title: const Text('English ðŸ‡¬ðŸ‡§'), onTap: () { ref.read(localeProvider.notifier).setLocale('en'); Navigator.pop(context); }),
                          ListTile(title: const Text('Lingala ðŸ‡¨ðŸ‡©'), onTap: () { ref.read(localeProvider.notifier).setLocale('ln'); Navigator.pop(context); }),
                          ListTile(title: const Text('Kituba ðŸ‡¨ðŸ‡¬'), onTap: () { ref.read(localeProvider.notifier).setLocale('kg'); Navigator.pop(context); }),
                        ],
                      ),
                    ),
                  );
                }),
            ListTile(leading: const Icon(Icons.dark_mode_rounded),
                title: const Text('ThÃ¨me'), subtitle: Text(themeString),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14), 
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Choisir le thÃ¨me'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(title: const Text('SystÃ¨me'), onTap: () { ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.system); Navigator.pop(context); }),
                          ListTile(title: const Text('Clair'), onTap: () { ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.light); Navigator.pop(context); }),
                          ListTile(title: const Text('Sombre'), onTap: () { ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.dark); Navigator.pop(context); }),
                        ],
                      ),
                    ),
                  );
                }),
          ]),
          _SettingsSection(title: 'DonnÃ©es', children: [
            SwitchListTile(value: true, onChanged: (_) {},
                title: const Text('Mode hors ligne'), secondary: const Icon(Icons.cloud_off_outlined)),
            ListTile(leading: const Icon(Icons.delete_outline_rounded),
                title: const Text('Vider le cache'), onTap: () {}),
          ]),
          _SettingsSection(title: 'LÃ©gal', children: [
            ListTile(leading: const Icon(Icons.privacy_tip_outlined),
                title: const Text('Politique de confidentialitÃ©'), onTap: () {}),
            ListTile(leading: const Icon(Icons.description_outlined),
                title: const Text('Conditions d\'utilisation'), onTap: () {}),
            ListTile(leading: const Icon(Icons.info_outline_rounded),
                title: const Text('Ã€ propos de Mobeko'),
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
