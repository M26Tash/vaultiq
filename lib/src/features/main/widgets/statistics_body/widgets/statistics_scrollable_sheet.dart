// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/drag_handle_indicator/drag_handle_indicator.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';

class StatisticsScrollableSheet extends StatelessWidget {
  final ScrollController scrollController;
  // final List<ScrollableSheetFilterItem> scrollableSheetFilterItems;
  const StatisticsScrollableSheet({
    required this.scrollController,
    // required this.scrollableSheetFilterItems,
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
        slivers: const [
          SliverToBoxAdapter(
            child: DragHandleIndicator(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: AppDimensions.large,
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: <_ScrollableSheetFilterItem>[
          //       for (final item in scrollableSheetFilterItems)
          //         _ScrollableSheetFilterItem(
          //           scrollableSheetFilterItem: item,
          //         ),
          //     ],
          //   ),
          // ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: AppDimensions.medium,
            ),
          ),
          // for (int i = 0; i < 2; i++)
          //   const SliverToBoxAdapter(
          //     child: TransactionItem(
          //       assetPath: AppAssets.chatGptIcon,

          //       title: 'ChatGPT Subscription',
          //       date: '27.01.2025 17:20',
          //       amount: 1070,
          //     ),
          //   ),
        ],
      ),
    );
  }
}

class _ScrollableSheetFilterItem extends StatelessWidget {
  final ScrollableSheetFilterItem scrollableSheetFilterItem;
  const _ScrollableSheetFilterItem({
    required this.scrollableSheetFilterItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: scrollableSheetFilterItem.onTap,
      child: Container(
        padding: const EdgeInsets.all(
          AppDimensions.large,
        ),
        decoration: BoxDecoration(
          color: context.theme.overlayBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppDimensions.medium,
            ),
          ),
        ),
        child: VectorImage(
          svgAssetPath: scrollableSheetFilterItem.assetPath,
          color: context.theme.primaryIconColor,
        ),
      ),
    );
  }
}

final class ScrollableSheetFilterItem {
  final VoidCallback onTap;
  final String assetPath;
  final String title;

  const ScrollableSheetFilterItem({
    required this.onTap,
    required this.assetPath,
    required this.title,
  });
}
