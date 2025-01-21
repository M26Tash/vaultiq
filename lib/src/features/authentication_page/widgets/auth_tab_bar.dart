import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/enum/auth_step.dart';
import 'package:vaultiq/src/features/authentication_page/cubit/auth_cubit.dart';

class AuthTabBar extends StatelessWidget {
  final AuthCubit authCubit;
  final AuthStep currentAuthStep;
  const AuthTabBar({
    required this.authCubit,
    required this.currentAuthStep,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.small),
      decoration: BoxDecoration(
        color: context.theme.cardBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.preLarge,
          ),
        ),
      ),
      child: Row(
        children: [
          _TabItem(
            onTap: () => authCubit.swapAuthStep(AuthStep.signIn),
            currentAuthStep: currentAuthStep,
            authStep: AuthStep.signIn,
            title: context.locale.signIn,
          ),
          const SizedBox(
            width: AppDimensions.small,
          ),
          _TabItem(
            onTap: () => authCubit.swapAuthStep(AuthStep.register),
            currentAuthStep: currentAuthStep,
            authStep: AuthStep.register,
            title: context.locale.register,
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final VoidCallback onTap;
  final AuthStep currentAuthStep;
  final AuthStep authStep;
  final String title;
  const _TabItem({
    required this.onTap,
    required this.currentAuthStep,
    required this.authStep,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.medium,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                AppDimensions.preLarge,
              ),
            ),
            color: currentAuthStep == authStep
                ? context.theme.primaryColor
                : context.theme.backgroundColor,
          ),
          child: Center(
            child: Text(
              title,
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                fontWeight: AppFonts.weightSemiBold,
                color: context.theme.bodyTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
