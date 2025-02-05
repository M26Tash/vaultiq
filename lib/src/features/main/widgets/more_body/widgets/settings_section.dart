import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';

class SettingsSection extends StatelessWidget {
  final List<SettingsItem> settingsItems;
  const SettingsSection({
    required this.settingsItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.large,
      ),
      decoration: BoxDecoration(
        color: context.theme.cardBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.medium,
          ),
        ),
      ),
      child: Column(
        children: <_SettingsItem>[
          for (final item in settingsItems) _SettingsItem(settingsItem: item),
        ],
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final SettingsItem settingsItem;
  const _SettingsItem({
    required this.settingsItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.large),
      child: InkWell(
        onTap: settingsItem.onTap,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: context.theme.backgroundColor,
              child: VectorImage(
                svgAssetPath: settingsItem.assetPath,
                color: context.theme.primaryIconColor,
              ),
            ),
            const SizedBox(width: AppDimensions.medium),
            if (settingsItem.subtitle != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    settingsItem.title,
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      color: context.theme.bodyTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                  Text(
                    settingsItem.subtitle!,
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      fontSize: AppFonts.sizeTitleMedium,
                      color: context.theme.hintTextColor,
                      fontWeight: AppFonts.weightRegular,
                    ),
                  ),
                ],
              ),
            if (settingsItem.subtitle == null)
              Text(
                settingsItem.title,
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.bodyTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
            const Spacer(),
            VectorImage(
              svgAssetPath: AppAssets.arrowRightIcon,
              color: context.theme.primaryIconColor,
            ),
          ],
        ),
      ),
    );
  }
}

final class SettingsItem {
  final VoidCallback onTap;
  final String assetPath;
  final String title;
  final String? subtitle;

  const SettingsItem({
    required this.onTap,
    required this.assetPath,
    required this.title,
    this.subtitle,
  });
}
