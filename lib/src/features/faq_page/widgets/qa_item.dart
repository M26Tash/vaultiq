import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';

class QAItem extends StatefulWidget {
  final String question;
  final String answer;
  const QAItem({
    required this.question,
    required this.answer,
    super.key,
  });

  @override
  State<QAItem> createState() => _QAItemState();
}

class _QAItemState extends State<QAItem> with TickerProviderStateMixin {
  bool isExpanded = false;

  void toggleContainer() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimensions.preLarge),
      ),
      onTap: toggleContainer,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(AppDimensions.large),
        decoration: BoxDecoration(
          color: context.theme.cardBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimensions.preLarge),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.question,
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      color: context.theme.bodyTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: VectorImage(
                    svgAssetPath: AppAssets.arrowDownIcon,
                    color: context.theme.primaryIconColor,
                  ),
                ),
              ],
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: isExpanded
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: AppDimensions.preLarge),
                        Text(
                          widget.answer,
                          style: context.themeData.textTheme.headlineSmall
                              ?.copyWith(
                            color: context.theme.bodyTextColor,
                            fontWeight: AppFonts.weightMedium,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
