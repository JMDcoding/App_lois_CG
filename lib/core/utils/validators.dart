/// Validateurs de formulaires réutilisables
class Validators {
  Validators._();

  /// Valide un email
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'L\'email est requis';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Veuillez entrer un email valide';
    }
    return null;
  }

  /// Valide un mot de passe (minimum 6 caractères)
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est requis';
    }
    if (value.length < 6) {
      return 'Le mot de passe doit contenir au moins 6 caractères';
    }
    return null;
  }

  /// Valide un mot de passe fort
  static String? strongPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est requis';
    }
    if (value.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Le mot de passe doit contenir une majuscule';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Le mot de passe doit contenir un chiffre';
    }
    return null;
  }

  /// Confirme que deux mots de passe correspondent
  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Veuillez confirmer le mot de passe';
    }
    if (value != password) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }

  /// Valide un champ requis
  static String? required(String? value, {String fieldName = 'Ce champ'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName est requis';
    }
    return null;
  }

  /// Valide un numéro de téléphone congolais
  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le numéro de téléphone est requis';
    }
    // Format congolais : +242 XX XXX XXXX ou 06 XXX XXXX
    final phoneRegex = RegExp(r'^(\+242|242)?[0-9]{9}$');
    final cleanNumber = value.replaceAll(RegExp(r'[\s\-()]'), '');
    if (!phoneRegex.hasMatch(cleanNumber)) {
      return 'Veuillez entrer un numéro de téléphone valide';
    }
    return null;
  }

  /// Valide un nom (minimum 2 caractères)
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Le nom est requis';
    }
    if (value.trim().length < 2) {
      return 'Le nom doit contenir au moins 2 caractères';
    }
    return null;
  }

  /// Valide une longueur minimale
  static String? minLength(String? value, int min, {String fieldName = 'Ce champ'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName est requis';
    }
    if (value.length < min) {
      return '$fieldName doit contenir au moins $min caractères';
    }
    return null;
  }

  /// Valide une longueur maximale
  static String? maxLength(String? value, int max, {String fieldName = 'Ce champ'}) {
    if (value != null && value.length > max) {
      return '$fieldName ne doit pas dépasser $max caractères';
    }
    return null;
  }
}
