import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/constants/font_family.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/custom_button/custom_button.dart';
import 'package:vaultiq/src/common/widgets/input_field/input_field.dart';
import 'package:vaultiq/src/features/forgot_password_page/cubit/forgot_password_cubit.dart';

class ForgotPasswordBody extends StatefulWidget {
  final ForgotPasswordCubit forgotPasswordCubit;
  const ForgotPasswordBody({
    required this.forgotPasswordCubit,
    super.key,
  });

  @override
  State<ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends State<ForgotPasswordBody> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        Text(
          context.locale.forgotPassword,
          style: context.themeData.textTheme.displayLarge?.copyWith(
            fontSize: AppFonts.sizeDisplayPreLarge,
            color: context.theme.bodyTextColor,
            fontWeight: AppFonts.weightBold,
            fontFamily: FontFamily.poppinsFamily,
          ),
        ),
        const SizedBox(height: AppDimensions.preLarge),
        Text(
          context.locale.dontWorryItHappens,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.labelTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        InputField(
          controller: _emailController,
          fieldTitle: context.locale.emailAddress,
          hintText: context.locale.enterYourEmailAddress,
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        CustomButton(
          onTap: () => widget.forgotPasswordCubit.resetPassword(
            email: _emailController.text.trim(),
          ),
          buttonText: context.locale.reset,
        ),
      ],
    );
  }
}
