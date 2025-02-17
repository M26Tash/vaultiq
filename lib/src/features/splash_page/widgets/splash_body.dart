import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/extensions/list_extension.dart';
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
    // print(result);
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
                'Please try again!',
                style: context.themeData.textTheme.displayLarge?.copyWith(
                  color: context.theme.bodyTextColor,
                ),
              ),
              CustomButton(
                buttonText: 'Try again',
                onTap: onTryAgainTap,
              ),
            ].insertBetween(
              const SizedBox(
                height: AppDimensions.superLarge,
              ),
            ),
          ),
        ),
      );
    }
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
