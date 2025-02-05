import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: context.theme.primaryColor,
          radius: 25,
        ),
        const SizedBox(width: AppDimensions.medium),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, welcome',
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                color: context.theme.hintTextColor,
                fontWeight: AppFonts.weightMedium,
              ),
            ),
            Text(
              'Muhammed',
              style: context.themeData.textTheme.headlineLarge?.copyWith(
                color: context.theme.bodyTextColor,
                fontWeight: AppFonts.weightSemiBold,
              ),
            ),
          ],
        ),
        const Spacer(),
        FloatingActionButton(
          backgroundColor: context.theme.cardBackgroundColor,
          shape: const CircleBorder(),
          onPressed: () {},
          child: VectorImage(
            svgAssetPath: AppAssets.notificationIcon,
            color: context.theme.primaryIconColor,
          ),
        ),
      ],
    );
  }
}
