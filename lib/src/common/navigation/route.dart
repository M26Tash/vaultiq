import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/navigation/guards/auth_guard.dart';
import 'package:vaultiq/src/common/utils/enum/transaction_type.dart';
import 'package:vaultiq/src/features/add_transaction_page/pages/add_transaction_page.dart';
import 'package:vaultiq/src/features/authentication_page/pages/auth_page.dart';
import 'package:vaultiq/src/features/default_currency_page/pages/default_currency_page.dart';
import 'package:vaultiq/src/features/forgot_password_page/pages/forgot_password_page.dart';
import 'package:vaultiq/src/features/local_auth_page/pages/local_auth_page.dart';
import 'package:vaultiq/src/features/main/pages/main_page.dart';
import 'package:vaultiq/src/features/my_account_page/pages/my_account_page.dart';
import 'package:vaultiq/src/features/otp_page/pages/otp_page.dart';
import 'package:vaultiq/src/features/splash_page/pages/splash_page.dart';

part 'route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: AuthRoute.page,
          guards: [
            AuthGuard(),
          ],
        ),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: DefaultCurrencyRoute.page),
        AutoRoute(page: OtpRoute.page),
        AutoRoute(page: MainRoute.page),
        AutoRoute(page: AddTransactionRoute.page),
        AutoRoute(page: MyAccountRoute.page),
        AutoRoute(page: LocalAuthRoute.page),
      ];
}
