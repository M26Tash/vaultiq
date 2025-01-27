import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';

class TransactionItem extends StatelessWidget {
  final String assetPath;
  final String title;
  final String date;
  final String amount;
  const TransactionItem({
    required this.assetPath,
    required this.title,
    required this.date,
    required this.amount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.large),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: context.theme.backgroundColor,
          ),
          const SizedBox(width: AppDimensions.medium),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.bodyTextColor,
                  fontWeight: AppFonts.weightBold,
                ),
              ),
              Text(
                date,
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.hintTextColor,
                  fontWeight: AppFonts.weightRegular,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '-\$$amount',
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.primaryRedColor,
                  fontWeight: AppFonts.weightBold,
                ),
              ),
              Text(
                'Completed',
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.hintTextColor,
                  fontWeight: AppFonts.weightRegular,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
