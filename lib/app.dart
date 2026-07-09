import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/l10n/app_localizations.dart';
import 'core/theme/app_theme.dart';
import 'core/providers/theme_provider.dart';
import 'core/providers/locale_provider.dart';
import 'routing/app_router.dart';

/// Application principale Mobeko
class MobekoApp extends ConsumerWidget {
  const MobekoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      // App info
      title: 'Mobeko',
      debugShowCheckedModeBanner: false,

      // Routing
      routerConfig: router,

      // Thème
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,

      // Localisation
      locale: locale,
      supportedLocales: const [
        Locale('fr'),      // Français
        Locale('en'),      // Anglais
        Locale('ln'),      // Lingala
        Locale('kg'),      // Kituba
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
