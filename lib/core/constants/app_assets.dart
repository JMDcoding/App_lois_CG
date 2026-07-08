/// Chemins vers les assets de l'application
class AppAssets {
  AppAssets._();

  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
  // Images
  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

  static const String _imagesPath = 'assets/images';
  static const String logo = '$_imagesPath/logo.png';
  static const String logoWhite = '$_imagesPath/logo_white.png';

  // Onboarding
  static const String _onboardingPath = '$_imagesPath/onboarding';
  static const String onboarding1 = '$_onboardingPath/onboarding_1.png';
  static const String onboarding2 = '$_onboardingPath/onboarding_2.png';
  static const String onboarding3 = '$_onboardingPath/onboarding_3.png';

  // Icons
  static const String _iconsPath = '$_imagesPath/icons';
  static const String iconWork = '$_iconsPath/work.svg';
  static const String iconFamily = '$_iconsPath/family.svg';
  static const String iconHousing = '$_iconsPath/housing.svg';
  static const String iconPolice = '$_iconsPath/police.svg';
  static const String iconJustice = '$_iconsPath/justice.svg';
  static const String iconHealth = '$_iconsPath/health.svg';
  static const String iconEducation = '$_iconsPath/education.svg';
  static const String iconTax = '$_iconsPath/tax.svg';
  static const String iconBusiness = '$_iconsPath/business.svg';
  static const String iconChildren = '$_iconsPath/children.svg';
  static const String iconWomen = '$_iconsPath/women.svg';
  static const String iconConsumer = '$_iconsPath/consumer.svg';
  static const String iconInheritance = '$_iconsPath/inheritance.svg';
  static const String iconProperty = '$_iconsPath/property.svg';
  static const String iconContracts = '$_iconsPath/contracts.svg';

  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
  // DonnÃ©es hors ligne
  // â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

  static const String _dataPath = 'assets/data/offline';
  static const String offlineCategories = '$_dataPath/categories.json';
  static const String offlineProcedures = '$_dataPath/procedures.json';
  static const String offlineEmergency = '$_dataPath/emergency.json';
}
