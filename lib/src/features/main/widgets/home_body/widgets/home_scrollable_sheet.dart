import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/drag_handle_indicator/drag_handle_indicator.dart';
import 'package:vaultiq/src/common/widgets/transaction_item/transaction_item.dart';

class HomeScrollableSheet extends StatelessWidget {
  final ScrollController scrollController;
  const HomeScrollableSheet({
    required this.scrollController,
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
              'Transactions',
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
          for (int i = 0; i < 2; i++)
            const SliverToBoxAdapter(
              child: TransactionItem(
                assetPath: AppAssets.chatGptIcon,
                title: 'ChatGPT Subscription',
                date: '27.01.2025 17:20',
                amount: '1,070.00',
              ),
            ),
        ],
      ),
    );
  }
}
