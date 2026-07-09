import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @appName.
  ///
  /// In fr, this message translates to:
  /// **'Mobeko'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In fr, this message translates to:
  /// **'La loi à portée de main'**
  String get appTagline;

  /// No description provided for @navHome.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get navHome;

  /// No description provided for @navLibrary.
  ///
  /// In fr, this message translates to:
  /// **'Bibliothèque'**
  String get navLibrary;

  /// No description provided for @navChat.
  ///
  /// In fr, this message translates to:
  /// **'Assistant'**
  String get navChat;

  /// No description provided for @navMap.
  ///
  /// In fr, this message translates to:
  /// **'Carte'**
  String get navMap;

  /// No description provided for @navProfile.
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get navProfile;

  /// Message de bienvenue sur l'écran d'accueil
  ///
  /// In fr, this message translates to:
  /// **'Bonjour, {name} 👋'**
  String welcomeMessage(String name);

  /// No description provided for @welcomeDefault.
  ///
  /// In fr, this message translates to:
  /// **'Bienvenue sur Mobeko 👋'**
  String get welcomeDefault;

  /// No description provided for @searchHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher une loi, un droit...'**
  String get searchHint;

  /// No description provided for @faqTitle.
  ///
  /// In fr, this message translates to:
  /// **'Questions fréquentes'**
  String get faqTitle;

  /// No description provided for @categoriesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Catégories'**
  String get categoriesTitle;

  /// No description provided for @newsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Actualités juridiques'**
  String get newsTitle;

  /// No description provided for @seeAll.
  ///
  /// In fr, this message translates to:
  /// **'Voir tout'**
  String get seeAll;

  /// No description provided for @login.
  ///
  /// In fr, this message translates to:
  /// **'Connexion'**
  String get login;

  /// No description provided for @register.
  ///
  /// In fr, this message translates to:
  /// **'Inscription'**
  String get register;

  /// No description provided for @email.
  ///
  /// In fr, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le mot de passe'**
  String get confirmPassword;

  /// No description provided for @fullName.
  ///
  /// In fr, this message translates to:
  /// **'Nom complet'**
  String get fullName;

  /// No description provided for @phone.
  ///
  /// In fr, this message translates to:
  /// **'Téléphone'**
  String get phone;

  /// No description provided for @forgotPassword.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe oublié ?'**
  String get forgotPassword;

  /// No description provided for @resetPassword.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser le mot de passe'**
  String get resetPassword;

  /// No description provided for @resetPasswordDescription.
  ///
  /// In fr, this message translates to:
  /// **'Entrez votre email pour recevoir un lien de réinitialisation.'**
  String get resetPasswordDescription;

  /// No description provided for @sendResetLink.
  ///
  /// In fr, this message translates to:
  /// **'Envoyer le lien'**
  String get sendResetLink;

  /// No description provided for @continueWithGoogle.
  ///
  /// In fr, this message translates to:
  /// **'Continuer avec Google'**
  String get continueWithGoogle;

  /// No description provided for @continueWithPhone.
  ///
  /// In fr, this message translates to:
  /// **'Continuer avec le téléphone'**
  String get continueWithPhone;

  /// No description provided for @continueAsGuest.
  ///
  /// In fr, this message translates to:
  /// **'Continuer en tant qu\'invité'**
  String get continueAsGuest;

  /// No description provided for @createAccount.
  ///
  /// In fr, this message translates to:
  /// **'Créer un compte'**
  String get createAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In fr, this message translates to:
  /// **'Déjà un compte ?'**
  String get alreadyHaveAccount;

  /// No description provided for @noAccount.
  ///
  /// In fr, this message translates to:
  /// **'Pas encore de compte ?'**
  String get noAccount;

  /// No description provided for @or.
  ///
  /// In fr, this message translates to:
  /// **'ou'**
  String get or;

  /// No description provided for @logout.
  ///
  /// In fr, this message translates to:
  /// **'Déconnexion'**
  String get logout;

  /// No description provided for @onboarding1Title.
  ///
  /// In fr, this message translates to:
  /// **'Connaissez vos droits'**
  String get onboarding1Title;

  /// No description provided for @onboarding1Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Accédez aux lois congolaises expliquées simplement, dans votre langue.'**
  String get onboarding1Subtitle;

  /// No description provided for @onboarding2Title.
  ///
  /// In fr, this message translates to:
  /// **'Assistant juridique IA'**
  String get onboarding2Title;

  /// No description provided for @onboarding2Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Posez vos questions juridiques et obtenez des réponses claires et documentées.'**
  String get onboarding2Subtitle;

  /// No description provided for @onboarding3Title.
  ///
  /// In fr, this message translates to:
  /// **'Guidez vos démarches'**
  String get onboarding3Title;

  /// No description provided for @onboarding3Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Suivez pas à pas vos démarches administratives avec tous les documents nécessaires.'**
  String get onboarding3Subtitle;

  /// No description provided for @getStarted.
  ///
  /// In fr, this message translates to:
  /// **'Commencer'**
  String get getStarted;

  /// No description provided for @skip.
  ///
  /// In fr, this message translates to:
  /// **'Passer'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In fr, this message translates to:
  /// **'Suivant'**
  String get next;

  /// No description provided for @categoryWork.
  ///
  /// In fr, this message translates to:
  /// **'Travail'**
  String get categoryWork;

  /// No description provided for @categoryFamily.
  ///
  /// In fr, this message translates to:
  /// **'Famille'**
  String get categoryFamily;

  /// No description provided for @categoryHousing.
  ///
  /// In fr, this message translates to:
  /// **'Logement'**
  String get categoryHousing;

  /// No description provided for @categoryPolice.
  ///
  /// In fr, this message translates to:
  /// **'Police'**
  String get categoryPolice;

  /// No description provided for @categoryJustice.
  ///
  /// In fr, this message translates to:
  /// **'Justice'**
  String get categoryJustice;

  /// No description provided for @categoryHealth.
  ///
  /// In fr, this message translates to:
  /// **'Santé'**
  String get categoryHealth;

  /// No description provided for @categoryEducation.
  ///
  /// In fr, this message translates to:
  /// **'Éducation'**
  String get categoryEducation;

  /// No description provided for @categoryTax.
  ///
  /// In fr, this message translates to:
  /// **'Fiscalité'**
  String get categoryTax;

  /// No description provided for @categoryBusiness.
  ///
  /// In fr, this message translates to:
  /// **'Entreprises'**
  String get categoryBusiness;

  /// No description provided for @categoryChildren.
  ///
  /// In fr, this message translates to:
  /// **'Enfants'**
  String get categoryChildren;

  /// No description provided for @categoryWomen.
  ///
  /// In fr, this message translates to:
  /// **'Femmes'**
  String get categoryWomen;

  /// No description provided for @categoryConsumer.
  ///
  /// In fr, this message translates to:
  /// **'Consommateurs'**
  String get categoryConsumer;

  /// No description provided for @categoryInheritance.
  ///
  /// In fr, this message translates to:
  /// **'Successions'**
  String get categoryInheritance;

  /// No description provided for @categoryProperty.
  ///
  /// In fr, this message translates to:
  /// **'Propriété'**
  String get categoryProperty;

  /// No description provided for @categoryContracts.
  ///
  /// In fr, this message translates to:
  /// **'Contrats'**
  String get categoryContracts;

  /// No description provided for @chatTitle.
  ///
  /// In fr, this message translates to:
  /// **'Assistant Juridique'**
  String get chatTitle;

  /// No description provided for @chatHint.
  ///
  /// In fr, this message translates to:
  /// **'Posez votre question juridique...'**
  String get chatHint;

  /// No description provided for @chatWelcome.
  ///
  /// In fr, this message translates to:
  /// **'Bonjour ! Je suis votre assistant juridique Mobeko. Comment puis-je vous aider aujourd\'hui ?'**
  String get chatWelcome;

  /// No description provided for @chatDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Les réponses fournies sont à titre informatif et ne constituent pas un conseil juridique professionnel.'**
  String get chatDisclaimer;

  /// No description provided for @emergencyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Urgence Juridique'**
  String get emergencyTitle;

  /// No description provided for @emergencySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Besoin d\'aide immédiate ?'**
  String get emergencySubtitle;

  /// No description provided for @emergencyArrest.
  ///
  /// In fr, this message translates to:
  /// **'Arrestation'**
  String get emergencyArrest;

  /// No description provided for @emergencyViolence.
  ///
  /// In fr, this message translates to:
  /// **'Violence'**
  String get emergencyViolence;

  /// No description provided for @emergencyEviction.
  ///
  /// In fr, this message translates to:
  /// **'Expulsion'**
  String get emergencyEviction;

  /// No description provided for @emergencyAccident.
  ///
  /// In fr, this message translates to:
  /// **'Accident'**
  String get emergencyAccident;

  /// No description provided for @emergencyScam.
  ///
  /// In fr, this message translates to:
  /// **'Arnaque'**
  String get emergencyScam;

  /// No description provided for @emergencyLandDispute.
  ///
  /// In fr, this message translates to:
  /// **'Litige foncier'**
  String get emergencyLandDispute;

  /// No description provided for @proceduresTitle.
  ///
  /// In fr, this message translates to:
  /// **'Démarches'**
  String get proceduresTitle;

  /// No description provided for @documentsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Documents'**
  String get documentsTitle;

  /// No description provided for @documentGenerator.
  ///
  /// In fr, this message translates to:
  /// **'Générateur de documents'**
  String get documentGenerator;

  /// No description provided for @scanDocument.
  ///
  /// In fr, this message translates to:
  /// **'Scanner un document'**
  String get scanDocument;

  /// No description provided for @favoritesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Favoris'**
  String get favoritesTitle;

  /// No description provided for @newsListTitle.
  ///
  /// In fr, this message translates to:
  /// **'Actualités'**
  String get newsListTitle;

  /// No description provided for @settingsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get settingsTitle;

  /// No description provided for @historyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Historique'**
  String get historyTitle;

  /// No description provided for @profileTitle.
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get profileTitle;

  /// No description provided for @editProfile.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le profil'**
  String get editProfile;

  /// No description provided for @language.
  ///
  /// In fr, this message translates to:
  /// **'Langue'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In fr, this message translates to:
  /// **'Thème'**
  String get theme;

  /// No description provided for @themeLight.
  ///
  /// In fr, this message translates to:
  /// **'Clair'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In fr, this message translates to:
  /// **'Sombre'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In fr, this message translates to:
  /// **'Système'**
  String get themeSystem;

  /// No description provided for @notifications.
  ///
  /// In fr, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @offlineMode.
  ///
  /// In fr, this message translates to:
  /// **'Mode hors ligne'**
  String get offlineMode;

  /// No description provided for @about.
  ///
  /// In fr, this message translates to:
  /// **'À propos'**
  String get about;

  /// No description provided for @version.
  ///
  /// In fr, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @privacyPolicy.
  ///
  /// In fr, this message translates to:
  /// **'Politique de confidentialité'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In fr, this message translates to:
  /// **'Conditions d\'utilisation'**
  String get termsOfService;

  /// No description provided for @loading.
  ///
  /// In fr, this message translates to:
  /// **'Chargement...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur est survenue'**
  String get error;

  /// No description provided for @retry.
  ///
  /// In fr, this message translates to:
  /// **'Réessayer'**
  String get retry;

  /// No description provided for @noResults.
  ///
  /// In fr, this message translates to:
  /// **'Aucun résultat'**
  String get noResults;

  /// No description provided for @noInternet.
  ///
  /// In fr, this message translates to:
  /// **'Pas de connexion Internet'**
  String get noInternet;

  /// No description provided for @offlineBanner.
  ///
  /// In fr, this message translates to:
  /// **'Mode hors ligne'**
  String get offlineBanner;

  /// No description provided for @save.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer'**
  String get delete;

  /// No description provided for @share.
  ///
  /// In fr, this message translates to:
  /// **'Partager'**
  String get share;

  /// No description provided for @download.
  ///
  /// In fr, this message translates to:
  /// **'Télécharger'**
  String get download;

  /// No description provided for @close.
  ///
  /// In fr, this message translates to:
  /// **'Fermer'**
  String get close;

  /// No description provided for @legalDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Les informations fournies par Mobeko sont à titre informatif uniquement et ne constituent pas un conseil juridique professionnel. Pour toute situation juridique spécifique, consultez un avocat qualifié.'**
  String get legalDisclaimer;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
