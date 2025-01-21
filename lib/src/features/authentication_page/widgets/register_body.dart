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

class RegisterBody extends StatefulWidget {
  final ValueChanged<CredentialData> onRegisterChanged;

  const RegisterBody({
    required this.onRegisterChanged,
    super.key,
  });

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  late final GlobalKey<FormState> _emailFormKey;
  late final GlobalKey<FormState> _passwordFormKey;
  late final GlobalKey<FormState> _confirmPasswordFormKey;

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();

    _emailFormKey = GlobalKey<FormState>();
    _passwordFormKey = GlobalKey<FormState>();
    _confirmPasswordFormKey = GlobalKey<FormState>();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(
          formKey: _emailFormKey,
          controller: _emailController,
          fieldTitle: context.locale.emailAddress,
          hintText: context.locale.emailExample,
          validator: (value) => Validators.validateEmail(value!),
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          formKey: _passwordFormKey,
          controller: _passwordController,
          fieldTitle: context.locale.createAPassword,
          hintText: context.locale.mustBeEightCharacters,
          validator: (value) => Validators.validatePassword(value!),
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          formKey: _confirmPasswordFormKey,
          controller: _confirmPasswordController,
          fieldTitle: context.locale.confirmPassword,
          hintText: context.locale.reEnterPassword,
          validator: (value) => Validators.validatePasswordIdentity(
            value!,
            _passwordController.text.trim(),
          ),
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        CustomButton(
          onTap: () {
            final emailValidate = _emailFormKey.currentState?.validate();
            final passwordValidate = _passwordFormKey.currentState?.validate();
            final confirmPasswordValidate =
                _confirmPasswordFormKey.currentState?.validate();

            if (emailValidate! &&
                passwordValidate! &&
                confirmPasswordValidate!) {
              widget.onRegisterChanged(
                CredentialData(
                  email: _emailController.text.trim(),
                  password: _passwordController.text.trim(),
                ),
              );
            }
          },
          buttonText: context.locale.register,
        ),
        const SizedBox(height: AppDimensions.extremeLarge),
        Center(
          child: Text(
            context.locale.otherRegisterOptions,
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
