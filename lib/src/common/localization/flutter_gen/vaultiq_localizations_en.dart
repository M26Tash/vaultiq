import 'vaultiq_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class VaultiqLocalizationEn extends VaultiqLocalization {
  VaultiqLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get welcomeBack => 'Welcome Back!';

  @override
  String get createAnAccount => 'Create an Account';

  @override
  String get signIn => 'Sign in';

  @override
  String get register => 'Register';

  @override
  String get emailAddress => 'Email address';

  @override
  String get emailExample => 'example@gmail.com';

  @override
  String get createAPassword => 'Create a password';

  @override
  String get mustBeEightCharacters => 'must be 8 characters';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get reEnterPassword => 're-enter password';

  @override
  String get otherRegisterOptions => 'Other register options';

  @override
  String get yourEmail => 'Your email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get otherSignInOptions => 'Other sign in options';

  @override
  String get continues => 'Continue';

  @override
  String get chooseTheCurrency => 'Choose the currency';

  @override
  String get selectYourDefaultCurrency => 'Select your default currency. You can add more later';

  @override
  String get search => 'Search';

  @override
  String get dontWorryItHappens => 'Don’t worry! It happens. Please enter the email associated with your account';

  @override
  String get enterYourEmailAddress => 'Enter you email address';

  @override
  String get reset => 'Reset';

  @override
  String get enterCode => 'Enter code';

  @override
  String get weveSentAOtpToYOurEmail => 'We’ve sent a One-Time Password (OTP) to your email ';

  @override
  String get invalidOtpTryAgain => 'Invalid OTP. Please check the code and try again';
}
