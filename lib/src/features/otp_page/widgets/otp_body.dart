import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/constants/font_family.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/features/otp_page/cubit/otp_cubit.dart';

class OtpBody extends StatelessWidget {
  final OtpCubit otpCubit;
  final String email;
  const OtpBody({
    required this.otpCubit,
    required this.email,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        Text(
          context.locale.enterCode,
          style: context.themeData.textTheme.displayLarge?.copyWith(
            fontSize: AppFonts.sizeDisplayPreLarge,
            color: context.theme.bodyTextColor,
            fontWeight: AppFonts.weightBold,
            fontFamily: FontFamily.poppinsFamily,
          ),
        ),
        const SizedBox(height: AppDimensions.preLarge),
        RichText(
          text: TextSpan(
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.labelTextColor,
              fontWeight: AppFonts.weightRegular,
            ),
            children: <TextSpan>[
              TextSpan(
                text: context.locale.weveSentAOtpToYOurEmail,
              ),
              TextSpan(
                text: email,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.accentColor,
                  fontWeight: AppFonts.weightSemiBold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        Pinput(
          length: AppDimensions.pinputLength,
          errorTextStyle: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.accentRedColor,
            fontWeight: AppFonts.weightMedium,
          ),
          defaultPinTheme: PinTheme(
            height: AppDimensions.pinputHeight,
            textStyle: context.themeData.textTheme.headlineLarge?.copyWith(
              color: context.theme.bodyTextColor,
            ),
            decoration: BoxDecoration(
              color: context.theme.backgroundColor,
              border: Border.all(
                color: context.theme.cardBackgroundColor,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  AppDimensions.preLarge,
                ),
              ),
            ),
          ),
          focusedPinTheme: PinTheme(
            height: AppDimensions.pinputHeight,
            textStyle: context.themeData.textTheme.headlineLarge?.copyWith(
              color: context.theme.bodyTextColor,
            ),
            decoration: BoxDecoration(
              color: context.theme.backgroundColor,
              border: Border.all(
                color: context.theme.primaryColor,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  AppDimensions.preLarge,
                ),
              ),
            ),
          ),
          submittedPinTheme: PinTheme(
            height: AppDimensions.pinputHeight,
            textStyle: context.themeData.textTheme.headlineLarge?.copyWith(
              color: context.theme.bodyTextColor,
            ),
            decoration: BoxDecoration(
              color: context.theme.backgroundColor,
              border: Border.all(
                color: context.theme.primaryColor,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  AppDimensions.preLarge,
                ),
              ),
            ),
          ),
          disabledPinTheme: PinTheme(
            height: AppDimensions.pinputHeight,
            textStyle: context.themeData.textTheme.headlineLarge?.copyWith(
              color: context.theme.bodyTextColor,
            ),
            decoration: BoxDecoration(
              color: context.theme.backgroundColor,
              border: Border.all(
                color: context.theme.cardBackgroundColor,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  AppDimensions.preLarge,
                ),
              ),
            ),
          ),
          errorPinTheme: PinTheme(
            height: AppDimensions.pinputHeight,
            textStyle: context.themeData.textTheme.headlineLarge?.copyWith(
              color: context.theme.bodyTextColor,
            ),
            decoration: BoxDecoration(
              color: context.theme.backgroundColor,
              border: Border.all(
                color: context.theme.primaryRedColor,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  AppDimensions.preLarge,
                ),
              ),
            ),
          ),
          onCompleted: (value) {
            if (value == '123456') {
              showDialog(
                context: context,
                builder: (context) => Center(
                  child: CircularProgressIndicator(
                    color: context.theme.primaryColor,
                  ),
                ),
              );

              Future.delayed(const Duration(milliseconds: 300)).then(
                (value) => otpCubit.navigateToDefaultCurrencyPage(),
              );
            }
          },
          validator: (value) {
            if (value != '123456') {
              return context.locale.invalidOtpTryAgain;
            }
            return null;
          },
        ),
      ],
    );
  }
}
