import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';

class CurrentBalance extends StatelessWidget {
  final String balance;
  const CurrentBalance({
    required this.balance,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: r'$ ',
            style: context.themeData.textTheme.displayLarge?.copyWith(
              fontSize: AppFonts.currencySignSizeFont,
              fontWeight: AppFonts.weightSemiBold,
              color: context.theme.currencySignColor,
            ),
          ),
          TextSpan(
            text: balance,
            style: context.themeData.textTheme.displayLarge?.copyWith(
              fontSize: AppFonts.balanceSizeFont,
              fontWeight: AppFonts.weightBold,
              color: context.theme.bodyTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
