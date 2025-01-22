import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';

class AddDialog extends StatelessWidget {
  final List<AddDialogItem> items;
  const AddDialog({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.dialogHorizontalPadding,
        vertical: AppDimensions.dialogVerticalPadding,
      ),
      // ignore: deprecated_member_use
      backgroundColor: Colors.black.withOpacity(.1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _AddDialogItem(
                  onTap: items[index].onTap,
                  assetPath: items[index].assetPath,
                  title: items[index].title,
                  subtitle: items[index].subtitle,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AddDialogItem extends StatelessWidget {
  final VoidCallback onTap;
  final String assetPath;
  final String title;
  final String subtitle;
  const _AddDialogItem({
    required this.onTap,
    required this.assetPath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.preLarge,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            FloatingActionButton(
              backgroundColor: context.theme.primaryColor,
              shape: const CircleBorder(),
              // ignore: avoid_returning_null_for_void
              onPressed: () => null,
              child: VectorImage(
                svgAssetPath: assetPath,
                color: context.theme.primaryIconColor,
                height: AppDimensions.iconSize,
                width: AppDimensions.iconSize,
              ),
            ),
            const SizedBox(width: AppDimensions.medium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.bodyTextColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      color: context.theme.bodyTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddDialogItem {
  final VoidCallback onTap;
  final String assetPath;
  final String title;
  final String subtitle;

  const AddDialogItem({
    required this.onTap,
    required this.assetPath,
    required this.title,
    required this.subtitle,
  });
}
