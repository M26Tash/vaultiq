import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/drag_handle_indicator/drag_handle_indicator.dart';
import 'package:vaultiq/src/common/widgets/transaction_item/transaction_item.dart';
import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';

class HomeScrollableSheet extends StatelessWidget {
  final ScrollController scrollController;
  final List<TransactionModel> transactions;
  const HomeScrollableSheet({
    required this.scrollController,
    required this.transactions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.large),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: context.theme.cardBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            AppDimensions.extraLarge,
          ),
          topRight: Radius.circular(
            AppDimensions.extraLarge,
          ),
        ),
      ),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          const SliverToBoxAdapter(
            child: DragHandleIndicator(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: AppDimensions.large,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              context.locale.transactions,
              style: context.themeData.textTheme.headlineLarge?.copyWith(
                color: context.theme.bodyTextColor,
                fontWeight: AppFonts.weightBold,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: AppDimensions.medium,
            ),
          ),
          if (transactions.isEmpty)
            SliverToBoxAdapter(
              child: Text(
                'EMPTY',
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.bodyTextColor,
                ),
              ),
            ),
          if (transactions.isNotEmpty)
            for (int i = 0; i < transactions.length; i++)
              SliverToBoxAdapter(
                child: TransactionItem(
                  assetPath: AppAssets.chatGptIcon,
                  transactionModel: transactions[i],
                ),
              ),
        ],
      ),
    );
  }
}
