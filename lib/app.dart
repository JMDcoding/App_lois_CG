import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/theme/app_theme.dart';
import 'routing/app_router.dart';

/// Provider pour le mode thème
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

/// Provider pour la locale
final localeProvider = StateProvider<Locale>((ref) => const Locale('fr'));

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
        Locale('ln'),      // Lingala
        Locale('kg'),      // Kituba
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
