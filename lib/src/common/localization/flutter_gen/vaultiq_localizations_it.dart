import 'vaultiq_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class VaultiqLocalizationIt extends VaultiqLocalization {
  VaultiqLocalizationIt([String locale = 'it']) : super(locale);

  @override
  String get welcomeBack => 'Bentornato!';

  @override
  String get createAnAccount => 'Crea un account';

  @override
  String get signIn => 'Accedi';

  @override
  String get register => 'Registrati';

  @override
  String get emailAddress => 'Indirizzo email';

  @override
  String get emailExample => 'example@gmail.com';

  @override
  String get createAPassword => 'Crea una password';

  @override
  String get mustBeEightCharacters => 'deve essere di 8 caratteri';

  @override
  String get confirmPassword => 'Conferma password';

  @override
  String get reEnterPassword => 'Reinserisci la password';

  @override
  String get otherRegisterOptions => 'Altre opzioni di registrazione';

  @override
  String get yourEmail => 'La tua email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Password dimenticata?';

  @override
  String get otherSignInOptions => 'Altre opzioni di accesso';

  @override
  String get continues => 'Continua';

  @override
  String get chooseTheCurrency => 'Scegli la valuta';

  @override
  String get selectYourDefaultCurrency => 'Seleziona la tua valuta predefinita. Puoi aggiungerne altre in seguito';

  @override
  String get search => 'Cerca';

  @override
  String get dontWorryItHappens => 'Non preoccuparti! Può succedere. Inserisci l\'email associata al tuo account';

  @override
  String get enterYourEmailAddress => 'Inserisci il tuo indirizzo email';

  @override
  String get reset => 'Reimposta';

  @override
  String get enterCode => 'Inserisci il codice';

  @override
  String get weveSentAOtpToYOurEmail => 'Abbiamo inviato una password temporanea (OTP) alla tua email ';

  @override
  String get invalidOtpTryAgain => 'OTP non valido. Controlla il codice e riprova';
}
