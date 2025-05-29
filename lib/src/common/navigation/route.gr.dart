// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

/// generated route for
/// [AboutAppPage]
class AboutAppRoute extends PageRouteInfo<void> {
  const AboutAppRoute({List<PageRouteInfo>? children})
    : super(AboutAppRoute.name, initialChildren: children);

  static const String name = 'AboutAppRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AboutAppPage();
    },
  );
}

/// generated route for
/// [AddTransactionPage]
class AddTransactionRoute extends PageRouteInfo<AddTransactionRouteArgs> {
  AddTransactionRoute({
    required TransactionType transactionType,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         AddTransactionRoute.name,
         args: AddTransactionRouteArgs(
           transactionType: transactionType,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'AddTransactionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddTransactionRouteArgs>();
      return AddTransactionPage(
        transactionType: args.transactionType,
        key: args.key,
      );
    },
  );
}

class AddTransactionRouteArgs {
  const AddTransactionRouteArgs({required this.transactionType, this.key});

  final TransactionType transactionType;

  final Key? key;

  @override
  String toString() {
    return 'AddTransactionRouteArgs{transactionType: $transactionType, key: $key}';
  }
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthPage();
    },
  );
}

/// generated route for
/// [ContactUsPage]
class ContactUsRoute extends PageRouteInfo<void> {
  const ContactUsRoute({List<PageRouteInfo>? children})
    : super(ContactUsRoute.name, initialChildren: children);

  static const String name = 'ContactUsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ContactUsPage();
    },
  );
}

/// generated route for
/// [DefaultCurrencyPage]
class DefaultCurrencyRoute extends PageRouteInfo<void> {
  const DefaultCurrencyRoute({List<PageRouteInfo>? children})
    : super(DefaultCurrencyRoute.name, initialChildren: children);

  static const String name = 'DefaultCurrencyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DefaultCurrencyPage();
    },
  );
}

/// generated route for
/// [FAQPage]
class FAQRoute extends PageRouteInfo<void> {
  const FAQRoute({List<PageRouteInfo>? children})
    : super(FAQRoute.name, initialChildren: children);

  static const String name = 'FAQRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FAQPage();
    },
  );
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [HelpCenterPage]
class HelpCenterRoute extends PageRouteInfo<void> {
  const HelpCenterRoute({List<PageRouteInfo>? children})
    : super(HelpCenterRoute.name, initialChildren: children);

  static const String name = 'HelpCenterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HelpCenterPage();
    },
  );
}

/// generated route for
/// [LocalAuthPage]
class LocalAuthRoute extends PageRouteInfo<void> {
  const LocalAuthRoute({List<PageRouteInfo>? children})
    : super(LocalAuthRoute.name, initialChildren: children);

  static const String name = 'LocalAuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LocalAuthPage();
    },
  );
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPage();
    },
  );
}

/// generated route for
/// [MyAccountPage]
class MyAccountRoute extends PageRouteInfo<MyAccountRouteArgs> {
  MyAccountRoute({
    required ProfileModel profileModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         MyAccountRoute.name,
         args: MyAccountRouteArgs(profileModel: profileModel, key: key),
         initialChildren: children,
       );

  static const String name = 'MyAccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MyAccountRouteArgs>();
      return MyAccountPage(profileModel: args.profileModel, key: args.key);
    },
  );
}

class MyAccountRouteArgs {
  const MyAccountRouteArgs({required this.profileModel, this.key});

  final ProfileModel profileModel;

  final Key? key;

  @override
  String toString() {
    return 'MyAccountRouteArgs{profileModel: $profileModel, key: $key}';
  }
}

/// generated route for
/// [OtpPage]
class OtpRoute extends PageRouteInfo<OtpRouteArgs> {
  OtpRoute({required String email, Key? key, List<PageRouteInfo>? children})
    : super(
        OtpRoute.name,
        args: OtpRouteArgs(email: email, key: key),
        initialChildren: children,
      );

  static const String name = 'OtpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return OtpPage(email: args.email, key: args.key);
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({required this.email, this.key});

  final String email;

  final Key? key;

  @override
  String toString() {
    return 'OtpRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}
