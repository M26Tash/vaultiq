import 'vaultiq_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class VaultiqLocalizationRu extends VaultiqLocalization {
  VaultiqLocalizationRu([String locale = 'ru']) : super(locale);

  @override
  String get welcomeBack => 'С возвращением!';

  @override
  String get createAnAccount => 'Создать аккаунт';

  @override
  String get signIn => 'Войти';

  @override
  String get register => 'Регистрация';

  @override
  String get emailAddress => 'Электронная почта';

  @override
  String get emailExample => 'example@gmail.com';

  @override
  String get createAPassword => 'Создайте пароль';

  @override
  String get mustBeEightCharacters => 'должно быть 8 символов';

  @override
  String get confirmPassword => 'Подтвердите пароль';

  @override
  String get reEnterPassword => 'Введите пароль снова';

  @override
  String get otherRegisterOptions => 'Другие варианты регистрации';

  @override
  String get yourEmail => 'Ваш e-mail';

  @override
  String get password => 'Пароль';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get otherSignInOptions => 'Другие способы входа';

  @override
  String get continues => 'Продолжить';

  @override
  String get chooseTheCurrency => 'Выберите валюту';

  @override
  String get selectYourDefaultCurrency => 'Выберите основную валюту. Вы сможете добавить другие позже';

  @override
  String get search => 'Поиск';

  @override
  String get dontWorryItHappens => 'Не беспокойтесь! Такое бывает. Введите электронную почту, связанную с вашим аккаунтом';

  @override
  String get enterYourEmailAddress => 'Введите ваш адрес электронной почты';

  @override
  String get reset => 'Сбросить';

  @override
  String get enterCode => 'Введите код';

  @override
  String get weveSentAOtpToYOurEmail => 'Мы отправили одноразовый пароль (OTP) на вашу почту ';

  @override
  String get invalidOtpTryAgain => 'Неверный OTP. Проверьте код и попробуйте снова';
}
