import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/navigation/guards/auth_guard.dart';
import 'package:vaultiq/src/features/authentication_page/pages/auth_page.dart';
import 'package:vaultiq/src/features/default_currency_page/pages/default_currency_page.dart';
import 'package:vaultiq/src/features/forgot_password_page/pages/forgot_password_page.dart';

import 'package:vaultiq/src/features/main/pages/main_page.dart';
import 'package:vaultiq/src/features/otp_page/pages/otp_page.dart';

part 'route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          initial: true,
          guards: [
            AuthGuard(),
          ],
        ),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: DefaultCurrencyRoute.page),
        AutoRoute(page: OtpRoute.page),
        AutoRoute(page: MainRoute.page),
      ];
}
