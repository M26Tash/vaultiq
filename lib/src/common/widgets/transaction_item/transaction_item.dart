import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/enum/transaction_type.dart';
import 'package:vaultiq/src/common/utils/extensions/string_extension.dart';
import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transactionModel;
  final String assetPath;
  const TransactionItem({
    required this.transactionModel,
    required this.assetPath,
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
            child: Image.asset(
              assetPath,
              color: context.theme.primaryIconColor,
            ),
          ),
          const SizedBox(width: AppDimensions.medium),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transactionModel.transactionTitle,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.bodyTextColor,
                  fontWeight: AppFonts.weightBold,
                ),
              ),
              Text(
                transactionModel.createdAt.toTransactionFormat(),
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
              Text.rich(
                TextSpan(
                  children: [
                    if (transactionModel.transactionType ==
                        TransactionType.expense)
                      TextSpan(
                        text: '-',
                        style:
                            context.themeData.textTheme.headlineSmall?.copyWith(
                          color: transactionModel.transactionType ==
                                  TransactionType.expense
                              ? context.theme.primaryRedColor
                              : context.theme.primaryGreenColor,
                          fontWeight: AppFonts.weightBold,
                        ),
                      ),
                    TextSpan(
                      text: '\$${transactionModel.defaultAmount}',
                      style:
                          context.themeData.textTheme.headlineSmall?.copyWith(
                        color: transactionModel.transactionType ==
                                TransactionType.expense
                            ? context.theme.primaryRedColor
                            : context.theme.primaryGreenColor,
                        fontWeight: AppFonts.weightBold,
                      ),
                    ),
                  ],
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
