import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';

final class VectorButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String svgAssetPath;
  final EdgeInsets? innerPadding;
  final double? cornerRadius;
  final Color? iconColor;

  const VectorButton({
    required this.onTap,
    required this.svgAssetPath,
    this.innerPadding,
    this.cornerRadius,
    this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        borderRadius: BorderRadius.all(
          Radius.circular(
            cornerRadius ?? AppDimensions.extraLarge,
          ),
        ),
        child: Container(
          padding: innerPadding ??
              const EdgeInsets.all(
                AppDimensions.large,
              ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                cornerRadius ?? AppDimensions.extraLarge,
              ),
            ),
          ),
          child: VectorImage(
            svgAssetPath: svgAssetPath,
            color: iconColor ?? context.theme.primaryIconColor,
          ),
        ),
      ),
    );
  }
}
