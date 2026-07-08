import 'package:flutter/material.dart';

/// Extensions utilitaires pour faciliter le dÃ©veloppement
extension BuildContextExtension on BuildContext {
  /// AccÃ¨s rapide au thÃ¨me
  ThemeData get theme => Theme.of(this);

  /// AccÃ¨s rapide au color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// AccÃ¨s rapide au text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// AccÃ¨s rapide aux dimensions de l'Ã©cran
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Largeur de l'Ã©cran
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// Hauteur de l'Ã©cran
  double get screenHeight => MediaQuery.sizeOf(this).height;

  /// Padding pour la zone de sÃ©curitÃ© (notch, barre de navigation)
  EdgeInsets get safePadding => MediaQuery.paddingOf(this);

  /// VÃ©rifie si le thÃ¨me est en mode sombre
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Affiche un SnackBar
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Theme.of(this).colorScheme.error
            : null,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Affiche un SnackBar de succÃ¨s
  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

extension StringExtension on String {
  /// PremiÃ¨re lettre en majuscule
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Chaque mot commence par une majuscule
  String get titleCase {
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// Tronque le texte Ã  une longueur donnÃ©e
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength - suffix.length)}$suffix';
  }
}

extension DateTimeExtension on DateTime {
  /// Format relatif ("il y a 2 heures", "hier", etc.)
  String get relativeTime {
    final now = DateTime.now();
    final diff = now.difference(this);

    if (diff.inSeconds < 60) return 'Ã€ l\'instant';
    if (diff.inMinutes < 60) return 'Il y a ${diff.inMinutes} min';
    if (diff.inHours < 24) return 'Il y a ${diff.inHours}h';
    if (diff.inDays < 2) return 'Hier';
    if (diff.inDays < 7) return 'Il y a ${diff.inDays} jours';
    if (diff.inDays < 30) return 'Il y a ${diff.inDays ~/ 7} sem.';
    if (diff.inDays < 365) return 'Il y a ${diff.inDays ~/ 30} mois';
    return 'Il y a ${diff.inDays ~/ 365} ans';
  }

  /// Format date courte (07/07/2026)
  String get shortDate {
    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year';
  }

  /// Format date longue (7 juillet 2026)
  String get longDate {
    const months = [
      'janvier', 'fÃ©vrier', 'mars', 'avril', 'mai', 'juin',
      'juillet', 'aoÃ»t', 'septembre', 'octobre', 'novembre', 'dÃ©cembre'
    ];
    return '$day ${months[month - 1]} $year';
  }
}

extension ListExtension<T> on List<T> {
  /// SÃ©pare les Ã©lÃ©ments avec un sÃ©parateur
  List<T> separated(T separator) {
    if (length <= 1) return this;
    final result = <T>[];
    for (int i = 0; i < length; i++) {
      result.add(this[i]);
      if (i < length - 1) result.add(separator);
    }
    return result;
  }
}
