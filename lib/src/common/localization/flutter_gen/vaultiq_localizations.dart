import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'vaultiq_localizations_en.dart';
import 'vaultiq_localizations_it.dart';
import 'vaultiq_localizations_ru.dart';
import 'vaultiq_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of VaultiqLocalization
/// returned by `VaultiqLocalization.of(context)`.
///
/// Applications need to include `VaultiqLocalization.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'flutter_gen/vaultiq_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: VaultiqLocalization.localizationsDelegates,
///   supportedLocales: VaultiqLocalization.supportedLocales,
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
/// be consistent with the languages listed in the VaultiqLocalization.supportedLocales
/// property.
abstract class VaultiqLocalization {
  VaultiqLocalization(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static VaultiqLocalization of(BuildContext context) {
    return Localizations.of<VaultiqLocalization>(context, VaultiqLocalization)!;
  }

  static const LocalizationsDelegate<VaultiqLocalization> delegate = _VaultiqLocalizationDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('it'),
    Locale('ru'),
    Locale('tr')
  ];

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// No description provided for @createAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an Account'**
  String get createAnAccount;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get emailAddress;

  /// No description provided for @emailExample.
  ///
  /// In en, this message translates to:
  /// **'example@gmail.com'**
  String get emailExample;

  /// No description provided for @createAPassword.
  ///
  /// In en, this message translates to:
  /// **'Create a password'**
  String get createAPassword;

  /// No description provided for @mustBeEightCharacters.
  ///
  /// In en, this message translates to:
  /// **'must be 8 characters'**
  String get mustBeEightCharacters;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @reEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'re-enter password'**
  String get reEnterPassword;

  /// No description provided for @otherRegisterOptions.
  ///
  /// In en, this message translates to:
  /// **'Other register options'**
  String get otherRegisterOptions;

  /// No description provided for @yourEmail.
  ///
  /// In en, this message translates to:
  /// **'Your email'**
  String get yourEmail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @otherSignInOptions.
  ///
  /// In en, this message translates to:
  /// **'Other sign in options'**
  String get otherSignInOptions;

  /// No description provided for @continues.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continues;

  /// No description provided for @chooseTheCurrency.
  ///
  /// In en, this message translates to:
  /// **'Choose the currency'**
  String get chooseTheCurrency;

  /// No description provided for @selectYourDefaultCurrency.
  ///
  /// In en, this message translates to:
  /// **'Select your default currency. You can add more later'**
  String get selectYourDefaultCurrency;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @dontWorryItHappens.
  ///
  /// In en, this message translates to:
  /// **'Don’t worry! It happens. Please enter the email associated with your account'**
  String get dontWorryItHappens;

  /// No description provided for @enterYourEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter you email address'**
  String get enterYourEmailAddress;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @enterCode.
  ///
  /// In en, this message translates to:
  /// **'Enter code'**
  String get enterCode;

  /// No description provided for @weveSentAOtpToYOurEmail.
  ///
  /// In en, this message translates to:
  /// **'We’ve sent a One-Time Password (OTP) to your email '**
  String get weveSentAOtpToYOurEmail;

  /// No description provided for @invalidOtpTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Invalid OTP. Please check the code and try again'**
  String get invalidOtpTryAgain;
}

class _VaultiqLocalizationDelegate extends LocalizationsDelegate<VaultiqLocalization> {
  const _VaultiqLocalizationDelegate();

  @override
  Future<VaultiqLocalization> load(Locale locale) {
    return SynchronousFuture<VaultiqLocalization>(lookupVaultiqLocalization(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'it', 'ru', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_VaultiqLocalizationDelegate old) => false;
}

VaultiqLocalization lookupVaultiqLocalization(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return VaultiqLocalizationEn();
    case 'it': return VaultiqLocalizationIt();
    case 'ru': return VaultiqLocalizationRu();
    case 'tr': return VaultiqLocalizationTr();
  }

  throw FlutterError(
    'VaultiqLocalization.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
