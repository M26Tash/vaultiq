import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';

class TransactionAction extends StatelessWidget {
  final VoidCallback onTransferTap;
  final VoidCallback onExpenseTap;
  const TransactionAction({
    required this.onTransferTap,
    required this.onExpenseTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.large,
        vertical: AppDimensions.large,
      ),
      decoration: BoxDecoration(
        color: context.theme.cardBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.superLarge,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: onTransferTap,
            child: Row(
              children: [
                VectorImage(
                  svgAssetPath: AppAssets.transferIcon,
                  color: context.theme.primaryIconColor,
                ),
                const SizedBox(width: AppDimensions.medium),
                Text(
                  'Transfer',
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    color: context.theme.bodyTextColor,
                    fontWeight: AppFonts.weightRegular,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: context.theme.overlayBackgroundColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  AppDimensions.superLarge,
                ),
              ),
            ),
            height: AppDimensions.dividerHeight,
            width: AppDimensions.dividerWidth,
          ),
          InkWell(
            onTap: onExpenseTap,
            child: Row(
              children: [
                VectorImage(
                  svgAssetPath: AppAssets.expenseIcon,
                  color: context.theme.primaryIconColor,
                ),
                const SizedBox(width: AppDimensions.medium),
                Text(
                  'Expense',
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    color: context.theme.bodyTextColor,
                    fontWeight: AppFonts.weightRegular,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
