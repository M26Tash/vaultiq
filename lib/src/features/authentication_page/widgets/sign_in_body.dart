import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/validators/validators.dart';
import 'package:vaultiq/src/common/widgets/custom_button/custom_button.dart';
import 'package:vaultiq/src/common/widgets/input_field/input_field.dart';
import 'package:vaultiq/src/core/domain/models/data_models/credential_data.dart';

class SignInBody extends StatefulWidget {
  final ValueChanged<CredentialData> onSignInChanged;
  final VoidCallback onForgotPasswordTap;
  const SignInBody({
    required this.onSignInChanged,
    required this.onForgotPasswordTap,
    super.key,
  });

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  late final GlobalKey<FormState> _emailFormKey;
  late final GlobalKey<FormState> _passwordFormKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _emailFormKey = GlobalKey<FormState>();
    _passwordFormKey = GlobalKey<FormState>();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(
          formKey: _emailFormKey,
          controller: _emailController,
          fieldTitle: context.locale.emailAddress,
          hintText: context.locale.yourEmail,
          validator: (value) => Validators.validateEmail(value!),
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          formKey: _passwordFormKey,
          controller: _passwordController,
          fieldTitle: context.locale.password,
          hintText: context.locale.password,
          validator: (value) => Validators.validatePassword(value!),
        ),
        const SizedBox(height: AppDimensions.medium),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: widget.onForgotPasswordTap,
              child: Text(
                context.locale.forgotPassword,
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.bodyTextColor,
                  fontWeight: AppFonts.weightRegular,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        CustomButton(
          onTap: () {
            final emailValidate = _emailFormKey.currentState?.validate();
            final passwordValidate = _passwordFormKey.currentState?.validate();

            if (emailValidate! && passwordValidate!) {
              widget.onSignInChanged(
                CredentialData(
                  email: _emailController.text.trim(),
                  password: _passwordController.text.trim(),
                ),
              );
            }
          },
          buttonText: context.locale.signIn,
        ),
        const SizedBox(height: AppDimensions.extremeLarge),
        Center(
          child: Text(
            context.locale.otherSignInOptions,
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              color: context.theme.labelTextColor,
              fontWeight: AppFonts.weightRegular,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.large),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppDimensions.large),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    AppDimensions.superLarge,
                  ),
                ),
                color: context.theme.cardBackgroundColor,
              ),
              child: Image.asset(
                AppAssets.googleIcon,
                width: AppDimensions.extraLarge,
              ),
            ),
            const SizedBox(width: AppDimensions.large),
            Container(
              padding: const EdgeInsets.all(AppDimensions.large),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    AppDimensions.superLarge,
                  ),
                ),
                color: context.theme.cardBackgroundColor,
              ),
              child: Image.asset(
                AppAssets.googleIcon,
                width: AppDimensions.extraLarge,
              ),
            ),
            const SizedBox(width: AppDimensions.large),
            Container(
              padding: const EdgeInsets.all(AppDimensions.large),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    AppDimensions.superLarge,
                  ),
                ),
                color: context.theme.cardBackgroundColor,
              ),
              child: Image.asset(
                AppAssets.googleIcon,
                width: AppDimensions.extraLarge,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
