// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Mobeko';

  @override
  String get appTagline => 'The law at your fingertips';

  @override
  String get navHome => 'Home';

  @override
  String get navLibrary => 'Library';

  @override
  String get navChat => 'Assistant';

  @override
  String get navMap => 'Map';

  @override
  String get navProfile => 'Profile';

  @override
  String welcomeMessage(String name) {
    return 'Hello, $name 👋';
  }

  @override
  String get welcomeDefault => 'Welcome to Mobeko 👋';

  @override
  String get searchHint => 'Search for a law, a right...';

  @override
  String get faqTitle => 'Frequently Asked Questions';

  @override
  String get categoriesTitle => 'Categories';

  @override
  String get newsTitle => 'Legal News';

  @override
  String get seeAll => 'See all';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get fullName => 'Full Name';

  @override
  String get phone => 'Phone';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get resetPasswordDescription =>
      'Enter your email to receive a reset link.';

  @override
  String get sendResetLink => 'Send Link';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get continueWithPhone => 'Continue with Phone';

  @override
  String get continueAsGuest => 'Continue as Guest';

  @override
  String get createAccount => 'Create an Account';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get noAccount => 'Don\'t have an account?';

  @override
  String get or => 'or';

  @override
  String get logout => 'Logout';

  @override
  String get onboarding1Title => 'Know Your Rights';

  @override
  String get onboarding1Subtitle =>
      'Access Congolese laws explained simply, in your language.';

  @override
  String get onboarding2Title => 'AI Legal Assistant';

  @override
  String get onboarding2Subtitle =>
      'Ask your legal questions and get clear, documented answers.';

  @override
  String get onboarding3Title => 'Guide Your Procedures';

  @override
  String get onboarding3Subtitle =>
      'Follow your administrative procedures step by step with all necessary documents.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get skip => 'Skip';

  @override
  String get next => 'Next';

  @override
  String get categoryWork => 'Work';

  @override
  String get categoryFamily => 'Family';

  @override
  String get categoryHousing => 'Housing';

  @override
  String get categoryPolice => 'Police';

  @override
  String get categoryJustice => 'Justice';

  @override
  String get categoryHealth => 'Health';

  @override
  String get categoryEducation => 'Education';

  @override
  String get categoryTax => 'Tax';

  @override
  String get categoryBusiness => 'Business';

  @override
  String get categoryChildren => 'Children';

  @override
  String get categoryWomen => 'Women';

  @override
  String get categoryConsumer => 'Consumer';

  @override
  String get categoryInheritance => 'Inheritance';

  @override
  String get categoryProperty => 'Property';

  @override
  String get categoryContracts => 'Contracts';

  @override
  String get chatTitle => 'Legal Assistant';

  @override
  String get chatHint => 'Ask your legal question...';

  @override
  String get chatWelcome =>
      'Hello! I am your Mobeko legal assistant. How can I help you today?';

  @override
  String get chatDisclaimer =>
      'The answers provided are for informational purposes and do not constitute professional legal advice.';

  @override
  String get emergencyTitle => 'Legal Emergency';

  @override
  String get emergencySubtitle => 'Need immediate help?';

  @override
  String get emergencyArrest => 'Arrest';

  @override
  String get emergencyViolence => 'Violence';

  @override
  String get emergencyEviction => 'Eviction';

  @override
  String get emergencyAccident => 'Accident';

  @override
  String get emergencyScam => 'Scam';

  @override
  String get emergencyLandDispute => 'Land Dispute';

  @override
  String get proceduresTitle => 'Procedures';

  @override
  String get documentsTitle => 'Documents';

  @override
  String get documentGenerator => 'Document Generator';

  @override
  String get scanDocument => 'Scan a document';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get newsListTitle => 'News';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get historyTitle => 'History';

  @override
  String get profileTitle => 'Profile';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'System';

  @override
  String get notifications => 'Notifications';

  @override
  String get offlineMode => 'Offline Mode';

  @override
  String get about => 'About';

  @override
  String get version => 'Version';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'An error occurred';

  @override
  String get retry => 'Retry';

  @override
  String get noResults => 'No results';

  @override
  String get noInternet => 'No Internet connection';

  @override
  String get offlineBanner => 'Offline Mode';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get share => 'Share';

  @override
  String get download => 'Download';

  @override
  String get close => 'Close';

  @override
  String get legalDisclaimer =>
      'The information provided by Mobeko is for informational purposes only and does not constitute professional legal advice. For any specific legal situation, consult a qualified lawyer.';
}
