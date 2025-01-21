import 'vaultiq_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class VaultiqLocalizationTr extends VaultiqLocalization {
  VaultiqLocalizationTr([String locale = 'tr']) : super(locale);

  @override
  String get welcomeBack => 'Tekrar hoş geldiniz!';

  @override
  String get createAnAccount => 'Hesap oluştur';

  @override
  String get signIn => 'Giriş yap';

  @override
  String get register => 'Kaydol';

  @override
  String get emailAddress => 'E-posta adresi';

  @override
  String get emailExample => 'example@gmail.com';

  @override
  String get createAPassword => 'Bir şifre oluşturun';

  @override
  String get mustBeEightCharacters => '8 karakter olmalı';

  @override
  String get confirmPassword => 'Şifreyi onaylayın';

  @override
  String get reEnterPassword => 'Şifreyi tekrar girin';

  @override
  String get otherRegisterOptions => 'Diğer kayıt seçenekleri';

  @override
  String get yourEmail => 'E-postanız';

  @override
  String get password => 'Şifre';

  @override
  String get forgotPassword => 'Şifrenizi mi unuttunuz?';

  @override
  String get otherSignInOptions => 'Diğer giriş seçenekleri';

  @override
  String get continues => 'Devam et';

  @override
  String get chooseTheCurrency => 'Para birimini seçin';

  @override
  String get selectYourDefaultCurrency => 'Varsayılan para biriminizi seçin. Daha sonra ekleyebilirsiniz';

  @override
  String get search => 'Ara';

  @override
  String get dontWorryItHappens => 'Endişelenmeyin! Olabilir. Lütfen hesabınızla ilişkili e-postayı girin';

  @override
  String get enterYourEmailAddress => 'E-posta adresinizi girin';

  @override
  String get reset => 'Sıfırla';

  @override
  String get enterCode => 'Kodu girin';

  @override
  String get weveSentAOtpToYOurEmail => 'E-postanıza bir Tek Kullanımlık Şifre (OTP) gönderdik ';

  @override
  String get invalidOtpTryAgain => 'Geçersiz OTP. Lütfen kodu kontrol edin ve tekrar deneyin';
}
