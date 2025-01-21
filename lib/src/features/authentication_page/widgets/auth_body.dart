import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/constants/font_family.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/enum/auth_step.dart';
import 'package:vaultiq/src/features/authentication_page/cubit/auth_cubit.dart';
import 'package:vaultiq/src/features/authentication_page/widgets/auth_tab_bar.dart';
import 'package:vaultiq/src/features/authentication_page/widgets/register_body.dart';
import 'package:vaultiq/src/features/authentication_page/widgets/sign_in_body.dart';

class AuthBody extends StatelessWidget {
  final AuthCubit authCubit;
  final AuthStep currentAuthStep;
  const AuthBody({
    required this.authCubit,
    required this.currentAuthStep,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        const SizedBox(height: AppDimensions.extraLarge),
        Center(
          child: Text(
            currentAuthStep == AuthStep.signIn
                ? context.locale.welcomeBack
                : context.locale.createAnAccount,
            style: context.themeData.textTheme.displayLarge?.copyWith(
              fontSize: AppFonts.sizeDisplayPreLarge,
              color: context.theme.bodyTextColor,
              fontWeight: AppFonts.weightBold,
              fontFamily: FontFamily.poppinsFamily,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        AuthTabBar(
          authCubit: authCubit,
          currentAuthStep: currentAuthStep,
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: currentAuthStep == AuthStep.signIn
              ? SignInBody(
                  onSignInChanged: (credential) => authCubit.signInWithPassword(
                    email: credential.email,
                    password: credential.password,
                  ),
                  onForgotPasswordTap: authCubit.navigateToForgotPasswordPage,
                )
              : RegisterBody(
                  onRegisterChanged: (credential) =>
                      authCubit.registerWithPassword(
                    email: credential.email,
                    password: credential.password,
                  ),
                ),
        ),
      ],
    );
  }
}
