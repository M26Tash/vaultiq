import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:sealed_currencies/sealed_currencies.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';

class CurrencyItem extends StatelessWidget {
  final String entry;
  final String? defaultCurrency;
  final ValueChanged<String> onCurrencyChanged;
  const CurrencyItem({
    required this.entry,
    required this.defaultCurrency,
    required this.onCurrencyChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fiatCurrency = FiatCurrency.maybeFromCode(entry);

    return GestureDetector(
      onTap: () => onCurrencyChanged(entry),
      child: Container(
        decoration: BoxDecoration(
          color: entry == defaultCurrency
              ? context.theme.accentColor
              : context.theme.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppDimensions.preLarge,
            ),
          ),
        ),
        child: RepaintBoundary(
          child: Padding(
            padding: const EdgeInsets.all(
              AppDimensions.large,
            ),
            child: Row(
              children: [
                CountryFlag.fromCountryCode(
                  entry.substring(0, entry.length - 1),
                ),
                const SizedBox(width: AppDimensions.medium),
                if (FiatCurrency.maybeFromCode(entry)?.name != null)
                  Expanded(
                    child: Text(
                      '${fiatCurrency?.namesNative.first}',
                      style:
                          context.themeData.textTheme.headlineMedium?.copyWith(
                        color: context.theme.bodyTextColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
