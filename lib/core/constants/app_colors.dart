import 'package:flutter/material.dart';

/// Palette de couleurs Mobeko
/// Inspirée des couleurs du drapeau et de la nature congolaise
class AppColors {
  AppColors._();

  // ═══════════════════════════════════════════════════════════
  // Couleurs principales
  // ═══════════════════════════════════════════════════════════

  /// Vert foncé - Couleur primaire profonde
  static const Color darkGreen = Color(0xFF081C15);

  /// Vert forêt - Couleur primaire
  static const Color forestGreen = Color(0xFF1B4332);

  /// Vert moyen - Couleur secondaire
  static const Color mediumGreen = Color(0xFF40916C);

  /// Vert clair - Couleur accent
  static const Color lightGreen = Color(0xFF74C69D);

  /// Blanc
  static const Color white = Color(0xFFFFFFFF);

  // ═══════════════════════════════════════════════════════════
  // Variantes supplémentaires
  // ═══════════════════════════════════════════════════════════

  /// Vert très clair pour les backgrounds
  static const Color mintGreen = Color(0xFFB7E4C7);

  /// Vert pastel pour les surfaces
  static const Color paleGreen = Color(0xFFD8F3DC);

  /// Vert sombre pour le mode sombre
  static const Color deepGreen = Color(0xFF052E16);

  // ═══════════════════════════════════════════════════════════
  // Couleurs fonctionnelles
  // ═══════════════════════════════════════════════════════════

  /// Rouge urgence
  static const Color emergency = Color(0xFFE63946);

  /// Orange avertissement
  static const Color warning = Color(0xFFF4A261);

  /// Bleu information
  static const Color info = Color(0xFF457B9D);

  /// Vert succès
  static const Color success = Color(0xFF2D6A4F);

  // ═══════════════════════════════════════════════════════════
  // Neutres
  // ═══════════════════════════════════════════════════════════

  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  // ═══════════════════════════════════════════════════════════
  // Mode sombre
  // ═══════════════════════════════════════════════════════════

  static const Color darkSurface = Color(0xFF0D1B12);
  static const Color darkCard = Color(0xFF132A1C);
  static const Color darkElevated = Color(0xFF1A3626);

  // ═══════════════════════════════════════════════════════════
  // Gradients
  // ═══════════════════════════════════════════════════════════

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [forestGreen, mediumGreen],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [darkGreen, forestGreen],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [mediumGreen, lightGreen],
  );

  static const LinearGradient emergencyGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFE63946), Color(0xFFFF6B6B)],
  );
}
