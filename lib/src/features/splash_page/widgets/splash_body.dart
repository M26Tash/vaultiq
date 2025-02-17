import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/custom_button/custom_button.dart';

class SplashBody extends StatelessWidget {
  final String? result;
  final VoidCallback onTryAgainTap;
  const SplashBody({
    required this.result,
    required this.onTryAgainTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (result == null || result == 'cleared') {
      return Center(
        child: CircularProgressIndicator(
          color: context.theme.primaryColor,
        ),
      );
    }
    if (result == 'fail') {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.large),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                context.locale.oops,
                style: context.themeData.textTheme.displayLarge?.copyWith(
                  color: context.theme.bodyTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
              const SizedBox(height: AppDimensions.large),
              Text(
                context.locale.somethingWentWrongOnOurEnd,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.labelTextColor,
                ),
              ),
              const SizedBox(height: AppDimensions.extraLarge),
              CustomButton(
                buttonText: context.locale.tryAgain,
                onTap: onTryAgainTap,
              ),
            ],
          ),
        ),
      );
    }
    return Center(
      child: CircularProgressIndicator(
        color: context.theme.primaryColor,
      ),
    );
  }
}
