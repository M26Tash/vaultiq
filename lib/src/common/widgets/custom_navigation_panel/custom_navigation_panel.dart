import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';

final class CustomNavigationPanel extends StatelessWidget {
  final int selectedIndex;
  final List<CustomNavigationItem> items;
  final VoidCallback onAddTap;
  final ValueChanged<int>? onIndexChanged;

  const CustomNavigationPanel({
    required this.selectedIndex,
    required this.items,
    required this.onAddTap,
    this.onIndexChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: AppDimensions.navigationPanelElevation,
      color: context.theme.backgroundColor,
      child: SizedBox(
        height: AppDimensions.navigationPanelHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.extraLarge,
            vertical: AppDimensions.medium,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var index = 0; index < 2; index++)
                _CustomNavigationItem(
                  itemIndex: index,
                  selectedIndex: selectedIndex,
                  navigationItem: items[index],
                  onIndexChanged: onIndexChanged,
                ),
              Column(
                children: [
                  FloatingActionButton(
                    heroTag: 'dialog_hero',
                    backgroundColor: context.theme.primaryColor,
                    shape: const CircleBorder(),
                    onPressed: onAddTap,
                    child: VectorImage(
                      width: AppDimensions.iconSize,
                      height: AppDimensions.iconSize,
                      svgAssetPath: AppAssets.addIcon,
                      color: context.theme.primaryIconColor,
                    ),
                  ),
                ],
              ),
              for (var index = 2; index < 4; index++)
                _CustomNavigationItem(
                  itemIndex: index,
                  selectedIndex: selectedIndex,
                  navigationItem: items[index],
                  onIndexChanged: onIndexChanged,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _CustomNavigationItem extends StatelessWidget {
  final int itemIndex;
  final int selectedIndex;
  final CustomNavigationItem navigationItem;
  final ValueChanged<int>? onIndexChanged;

  const _CustomNavigationItem({
    required this.itemIndex,
    required this.selectedIndex,
    required this.navigationItem,
    this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    const selectedIconScale = 1.4;
    const unselectedIconScale = 1.0;

    final activeColor = context.theme.primaryColor;
    final inactiveColor = context.theme.secondaryIconColor;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onIndexChanged?.call(itemIndex),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.medium),
        child: Column(
          children: [
            AnimatedScale(
              scale: itemIndex == selectedIndex
                  ? selectedIconScale
                  : unselectedIconScale,
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              child: VectorImage(
                width: AppDimensions.navigationPanelIconSize,
                height: AppDimensions.navigationPanelIconSize,
                svgAssetPath: navigationItem.iconPath,
                color: itemIndex == selectedIndex ? activeColor : inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class CustomNavigationItem {
  final String iconPath;

  const CustomNavigationItem({
    required this.iconPath,
  });
}
