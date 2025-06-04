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
  VaultiqLocalization(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static VaultiqLocalization of(BuildContext context) {
    return Localizations.of<VaultiqLocalization>(context, VaultiqLocalization)!;
  }

  static const LocalizationsDelegate<VaultiqLocalization> delegate =
      _VaultiqLocalizationDelegate();

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

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// No description provided for @keepTrackOfNewChanges.
  ///
  /// In en, this message translates to:
  /// **'Keep track of new changes'**
  String get keepTrackOfNewChanges;

  /// No description provided for @income.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get income;

  /// No description provided for @recordYourIncomes.
  ///
  /// In en, this message translates to:
  /// **'Record your incomes'**
  String get recordYourIncomes;

  /// No description provided for @expense.
  ///
  /// In en, this message translates to:
  /// **'Expense'**
  String get expense;

  /// No description provided for @knowWhereAndWhenYouSpend.
  ///
  /// In en, this message translates to:
  /// **'Know where and when you spend'**
  String get knowWhereAndWhenYouSpend;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @makeTransfersEasily.
  ///
  /// In en, this message translates to:
  /// **'Make transfers easily'**
  String get makeTransfersEasily;

  /// No description provided for @exchangeRate.
  ///
  /// In en, this message translates to:
  /// **'Exchange rate'**
  String get exchangeRate;

  /// No description provided for @stayUpToDateEveryTime.
  ///
  /// In en, this message translates to:
  /// **'Stay up to date every time'**
  String get stayUpToDateEveryTime;

  /// No description provided for @cryptoRate.
  ///
  /// In en, this message translates to:
  /// **'Crypto rate'**
  String get cryptoRate;

  /// No description provided for @beAwareOfFutureMoneyTendance.
  ///
  /// In en, this message translates to:
  /// **'Be aware of future money tendance'**
  String get beAwareOfFutureMoneyTendance;

  /// No description provided for @oops.
  ///
  /// In en, this message translates to:
  /// **'Ooops!'**
  String get oops;

  /// No description provided for @somethingWentWrongOnOurEnd.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong on our end. Please try again. If the issue persists, check back later'**
  String get somethingWentWrongOnOurEnd;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @myBalance.
  ///
  /// In en, this message translates to:
  /// **'My Balance'**
  String get myBalance;

  /// No description provided for @getPlan.
  ///
  /// In en, this message translates to:
  /// **'Get plan'**
  String get getPlan;

  /// No description provided for @recentTransaction.
  ///
  /// In en, this message translates to:
  /// **'Recent Transaction'**
  String get recentTransaction;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get myAccount;

  /// No description provided for @makeChangesToYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Make changes to your account'**
  String get makeChangesToYourAccount;

  /// No description provided for @faceIdTouchId.
  ///
  /// In en, this message translates to:
  /// **'Face ID / Touch ID'**
  String get faceIdTouchId;

  /// No description provided for @manageYourDeviceSecurity.
  ///
  /// In en, this message translates to:
  /// **'Manage your device security'**
  String get manageYourDeviceSecurity;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @setYourPreferredAppLanguage.
  ///
  /// In en, this message translates to:
  /// **'Set your preferred app language'**
  String get setYourPreferredAppLanguage;

  /// No description provided for @helpAndSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpAndSupport;

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get aboutApp;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @furtherSecureYourAccountForSafety.
  ///
  /// In en, this message translates to:
  /// **'Further secure your account for safety'**
  String get furtherSecureYourAccountForSafety;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;
}

class _VaultiqLocalizationDelegate
    extends LocalizationsDelegate<VaultiqLocalization> {
  const _VaultiqLocalizationDelegate();

  @override
  Future<VaultiqLocalization> load(Locale locale) {
    return SynchronousFuture<VaultiqLocalization>(
        lookupVaultiqLocalization(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'it', 'ru', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_VaultiqLocalizationDelegate old) => false;
}

VaultiqLocalization lookupVaultiqLocalization(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return VaultiqLocalizationEn();
    case 'it':
      return VaultiqLocalizationIt();
    case 'ru':
      return VaultiqLocalizationRu();
    case 'tr':
      return VaultiqLocalizationTr();
  }

  throw FlutterError(
      'VaultiqLocalization.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
