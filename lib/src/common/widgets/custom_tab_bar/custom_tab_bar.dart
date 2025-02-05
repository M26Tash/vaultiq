import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/extensions/list_extension.dart';

class CustomTabBar extends StatelessWidget {
  final Enum currentTab;
  final List<TabItem> tabItems;
  const CustomTabBar({
    required this.currentTab,
    required this.tabItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.small),
      decoration: BoxDecoration(
        color: context.theme.cardBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.preLarge,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          for (final item in tabItems)
            _TabItem(
              tabItem: item,
              currentTab: currentTab,
            ),
        ].insertBetween(
          const SizedBox(width: AppDimensions.small),
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final TabItem tabItem;
  final Enum currentTab;

  const _TabItem({
    required this.tabItem,
    required this.currentTab,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: tabItem.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.medium,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                AppDimensions.preLarge,
              ),
            ),
            color: currentTab == tabItem.tab
                ? context.theme.primaryColor
                : context.theme.backgroundColor,
          ),
          child: Center(
            child: Text(
              tabItem.title,
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                fontWeight: AppFonts.weightSemiBold,
                color: context.theme.bodyTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class TabItem {
  final VoidCallback onTap;
  final Enum tab;
  final String title;

  const TabItem({
    required this.onTap,
    required this.tab,
    required this.title,
  });
}
