import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';

final class InputField extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  final String? Function(String?)? validator;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? fieldTitle;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final bool? readOnly;
  final TextCapitalization textCapitalization;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final String? initialValue;
  final List<TextInputFormatter>? formatters;
  final bool enableInteractiveSelection;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;

  const InputField({
    this.hintText,
    this.keyboardType,
    this.formKey,
    this.validator,
    this.onChanged,
    this.controller,
    this.inputDecoration,
    this.onTap,
    this.onEditingComplete,
    this.readOnly,
    this.fieldTitle,
    this.formatters,
    this.focusNode,
    this.textCapitalization = TextCapitalization.sentences,
    this.initialValue,
    this.enableInteractiveSelection = true,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themePath = context.themeData.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (fieldTitle != null)
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.extraSmall),
            child: Text(
              '$fieldTitle',
              style: themePath.headlineSmall?.copyWith(
                fontWeight: AppFonts.weightRegular,
                color: context.theme.bodyTextColor,
              ),
            ),
          ),
        Form(
          key: formKey,
          child: TextFormField(
            enableInteractiveSelection: enableInteractiveSelection,
            autovalidateMode: AutovalidateMode.disabled,
            initialValue: initialValue,
            onTap: onTap,
            onEditingComplete: onEditingComplete,
            readOnly: readOnly ?? false,
            keyboardType: keyboardType,
            inputFormatters: formatters,
            textCapitalization: textCapitalization,
            style: themePath.headlineMedium?.copyWith(
              color: colorPath.subTextColor,
              fontWeight: AppFonts.weightMedium,
            ),
            controller: controller,
            validator: validator,
            cursorColor: colorPath.primaryColor,
            focusNode: focusNode,
            decoration: inputDecoration ??
                InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: AppDimensions.medium,
                    horizontal: AppDimensions.large,
                  ),
                  filled: true,
                  fillColor: colorPath.cardBackgroundColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorPath.cardBackgroundColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        AppDimensions.inputFieldBorderRadius,
                      ),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorPath.cardBackgroundColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        AppDimensions.inputFieldBorderRadius,
                      ),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorPath.cardBackgroundColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        AppDimensions.inputFieldBorderRadius,
                      ),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorPath.accentRedColor),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        AppDimensions.inputFieldBorderRadius,
                      ),
                    ),
                  ),
                  errorStyle:
                      context.themeData.textTheme.headlineSmall?.copyWith(
                    color: context.theme.accentRedColor,
                    fontWeight: AppFonts.weightMedium,
                  ),
                  hintText: hintText,
                  hintStyle: hintStyle ??
                      themePath.headlineMedium?.copyWith(
                        fontWeight: AppFonts.weightRegular,
                        color: context.theme.hintTextColor,
                        height: AppFonts.sizeFactorLarge,
                      ),
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
