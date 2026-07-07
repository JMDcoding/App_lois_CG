import 'package:intl/intl.dart';

/// Utilitaire de formatage de dates pour le contexte congolais
class DateFormatter {
  DateFormatter._();

  static final DateFormat _shortDate = DateFormat('dd/MM/yyyy');
  static final DateFormat _longDate = DateFormat('d MMMM yyyy', 'fr_FR');
  static final DateFormat _dateTime = DateFormat('dd/MM/yyyy HH:mm', 'fr_FR');
  static final DateFormat _time = DateFormat('HH:mm');

  /// Format court : 07/07/2026
  static String short(DateTime date) => _shortDate.format(date);

  /// Format long : 7 juillet 2026
  static String long(DateTime date) => _longDate.format(date);

  /// Format date + heure : 07/07/2026 14:30
  static String dateTime(DateTime date) => _dateTime.format(date);

  /// Format heure : 14:30
  static String time(DateTime date) => _time.format(date);

  /// Format relatif
  static String relative(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.isNegative) {
      // Date future
      final absDiff = date.difference(now);
      if (absDiff.inDays == 0) return 'Aujourd\'hui';
      if (absDiff.inDays == 1) return 'Demain';
      if (absDiff.inDays < 7) return 'Dans ${absDiff.inDays} jours';
      if (absDiff.inDays < 30) return 'Dans ${absDiff.inDays ~/ 7} semaines';
      return long(date);
    }

    if (diff.inSeconds < 60) return 'À l\'instant';
    if (diff.inMinutes < 60) return 'Il y a ${diff.inMinutes} min';
    if (diff.inHours < 24) return 'Il y a ${diff.inHours}h';
    if (diff.inDays == 1) return 'Hier';
    if (diff.inDays < 7) return 'Il y a ${diff.inDays} jours';
    if (diff.inDays < 30) return 'Il y a ${diff.inDays ~/ 7} semaines';
    if (diff.inDays < 365) return 'Il y a ${diff.inDays ~/ 30} mois';
    return 'Il y a ${diff.inDays ~/ 365} ans';
  }

  /// Format pour affichage dans les listes
  static String listFormat(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays == 0) return time(date);
    if (diff.inDays == 1) return 'Hier';
    if (diff.inDays < 7) return DateFormat('EEEE', 'fr_FR').format(date);
    return short(date);
  }
}
