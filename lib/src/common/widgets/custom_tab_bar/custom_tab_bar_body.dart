import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/utils/extensions/list_extension.dart';
import 'package:vaultiq/src/common/widgets/custom_tab_bar/custom_tab_bar.dart';

class CustomTabBarBody extends StatelessWidget {
  final Enum currentTab;
  final List<TabItem> tabItems;
  final Widget body;
  final Widget? header;
  final EdgeInsetsGeometry? padding;
  const CustomTabBarBody({
    required this.currentTab,
    required this.tabItems,
    required this.body,
    this.header,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding ?? const EdgeInsets.all(AppDimensions.large),
      children: <Widget>[
        if (header != null) header!,
        CustomTabBar(
          currentTab: currentTab,
          tabItems: tabItems,
        ),
        body,
      ].insertBetween(
        const SizedBox(
          height: AppDimensions.extraLarge,
        ),
      ),
    );
  }
}
