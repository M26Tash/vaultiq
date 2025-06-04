import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/vector_button/vector_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onLeadingTap;
  final String? svgAssetPath;
  final String? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final TabController? tabController;
  final ValueChanged<int>? onTabChange;
  const CustomAppBar({
    this.onLeadingTap,
    this.svgAssetPath,
    this.title,
    this.centerTitle = true,
    this.actions,
    this.bottom,
    this.tabController,
    this.onTabChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      elevation: AppDimensions.none,
      titleSpacing: AppDimensions.none,
      leadingWidth: svgAssetPath == null ? AppDimensions.none : null,
      leading: svgAssetPath == null
          ? const SizedBox()
          : VectorButton(
              onTap: onLeadingTap,
              svgAssetPath: svgAssetPath!,
            ),
      title: Text(
        title ?? '',
        style: context.themeData.textTheme.displaySmall?.copyWith(
          color: context.theme.bodyTextColor,
          fontWeight: AppFonts.weightMedium,
          fontSize: AppFonts.sizeAppBarFont,
        ),
      ),
      centerTitle: centerTitle,
      actions: actions,
      automaticallyImplyLeading: false,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        bottom == null ? kToolbarHeight : AppDimensions.extendedKToolbarHeight,
      );
}
