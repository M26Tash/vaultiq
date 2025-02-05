import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';

class DragHandleIndicator extends StatelessWidget {
  const DragHandleIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.overlayBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppDimensions.large,
            ),
          ),
        ),
        height: AppDimensions.dragIndicatorHeight,
        width: AppDimensions.dragIndicatorWidth,
      ),
    );
  }
}
