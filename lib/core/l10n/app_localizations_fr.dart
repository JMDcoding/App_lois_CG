// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Mobeko';

  @override
  String get appTagline => 'La loi à portée de main';

  @override
  String get navHome => 'Accueil';

  @override
  String get navLibrary => 'Bibliothèque';

  @override
  String get navChat => 'Assistant';

  @override
  String get navMap => 'Carte';

  @override
  String get navProfile => 'Profil';

  @override
  String welcomeMessage(String name) {
    return 'Bonjour, $name 👋';
  }

  @override
  String get welcomeDefault => 'Bienvenue sur Mobeko 👋';

  @override
  String get searchHint => 'Rechercher une loi, un droit...';

  @override
  String get faqTitle => 'Questions fréquentes';

  @override
  String get categoriesTitle => 'Catégories';

  @override
  String get newsTitle => 'Actualités juridiques';

  @override
  String get seeAll => 'Voir tout';

  @override
  String get login => 'Connexion';

  @override
  String get register => 'Inscription';

  @override
  String get email => 'Email';

  @override
  String get password => 'Mot de passe';

  @override
  String get confirmPassword => 'Confirmer le mot de passe';

  @override
  String get fullName => 'Nom complet';

  @override
  String get phone => 'Téléphone';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get resetPassword => 'Réinitialiser le mot de passe';

  @override
  String get resetPasswordDescription =>
      'Entrez votre email pour recevoir un lien de réinitialisation.';

  @override
  String get sendResetLink => 'Envoyer le lien';

  @override
  String get continueWithGoogle => 'Continuer avec Google';

  @override
  String get continueWithPhone => 'Continuer avec le téléphone';

  @override
  String get continueAsGuest => 'Continuer en tant qu\'invité';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get alreadyHaveAccount => 'Déjà un compte ?';

  @override
  String get noAccount => 'Pas encore de compte ?';

  @override
  String get or => 'ou';

  @override
  String get logout => 'Déconnexion';

  @override
  String get onboarding1Title => 'Connaissez vos droits';

  @override
  String get onboarding1Subtitle =>
      'Accédez aux lois congolaises expliquées simplement, dans votre langue.';

  @override
  String get onboarding2Title => 'Assistant juridique IA';

  @override
  String get onboarding2Subtitle =>
      'Posez vos questions juridiques et obtenez des réponses claires et documentées.';

  @override
  String get onboarding3Title => 'Guidez vos démarches';

  @override
  String get onboarding3Subtitle =>
      'Suivez pas à pas vos démarches administratives avec tous les documents nécessaires.';

  @override
  String get getStarted => 'Commencer';

  @override
  String get skip => 'Passer';

  @override
  String get next => 'Suivant';

  @override
  String get categoryWork => 'Travail';

  @override
  String get categoryFamily => 'Famille';

  @override
  String get categoryHousing => 'Logement';

  @override
  String get categoryPolice => 'Police';

  @override
  String get categoryJustice => 'Justice';

  @override
  String get categoryHealth => 'Santé';

  @override
  String get categoryEducation => 'Éducation';

  @override
  String get categoryTax => 'Fiscalité';

  @override
  String get categoryBusiness => 'Entreprises';

  @override
  String get categoryChildren => 'Enfants';

  @override
  String get categoryWomen => 'Femmes';

  @override
  String get categoryConsumer => 'Consommateurs';

  @override
  String get categoryInheritance => 'Successions';

  @override
  String get categoryProperty => 'Propriété';

  @override
  String get categoryContracts => 'Contrats';

  @override
  String get chatTitle => 'Assistant Juridique';

  @override
  String get chatHint => 'Posez votre question juridique...';

  @override
  String get chatWelcome =>
      'Bonjour ! Je suis votre assistant juridique Mobeko. Comment puis-je vous aider aujourd\'hui ?';

  @override
  String get chatDisclaimer =>
      'Les réponses fournies sont à titre informatif et ne constituent pas un conseil juridique professionnel.';

  @override
  String get emergencyTitle => 'Urgence Juridique';

  @override
  String get emergencySubtitle => 'Besoin d\'aide immédiate ?';

  @override
  String get emergencyArrest => 'Arrestation';

  @override
  String get emergencyViolence => 'Violence';

  @override
  String get emergencyEviction => 'Expulsion';

  @override
  String get emergencyAccident => 'Accident';

  @override
  String get emergencyScam => 'Arnaque';

  @override
  String get emergencyLandDispute => 'Litige foncier';

  @override
  String get proceduresTitle => 'Démarches';

  @override
  String get documentsTitle => 'Documents';

  @override
  String get documentGenerator => 'Générateur de documents';

  @override
  String get scanDocument => 'Scanner un document';

  @override
  String get favoritesTitle => 'Favoris';

  @override
  String get newsListTitle => 'Actualités';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get historyTitle => 'Historique';

  @override
  String get profileTitle => 'Profil';

  @override
  String get editProfile => 'Modifier le profil';

  @override
  String get language => 'Langue';

  @override
  String get theme => 'Thème';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get themeSystem => 'Système';

  @override
  String get notifications => 'Notifications';

  @override
  String get offlineMode => 'Mode hors ligne';

  @override
  String get about => 'À propos';

  @override
  String get version => 'Version';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get termsOfService => 'Conditions d\'utilisation';

  @override
  String get loading => 'Chargement...';

  @override
  String get error => 'Une erreur est survenue';

  @override
  String get retry => 'Réessayer';

  @override
  String get noResults => 'Aucun résultat';

  @override
  String get noInternet => 'Pas de connexion Internet';

  @override
  String get offlineBanner => 'Mode hors ligne';

  @override
  String get save => 'Enregistrer';

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get share => 'Partager';

  @override
  String get download => 'Télécharger';

  @override
  String get close => 'Fermer';

  @override
  String get legalDisclaimer =>
      'Les informations fournies par Mobeko sont à titre informatif uniquement et ne constituent pas un conseil juridique professionnel. Pour toute situation juridique spécifique, consultez un avocat qualifié.';
}
