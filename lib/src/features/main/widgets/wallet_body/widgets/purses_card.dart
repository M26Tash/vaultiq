import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/extensions/list_extension.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';

class PursesCardSection extends StatelessWidget {
  const PursesCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.large),
      decoration: BoxDecoration(
        color: context.theme.cardBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.medium,
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text(
                'Test Pursue',
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  fontSize: AppFonts.sizeHeadlinePreLarge,
                  color: context.theme.bodyTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
              const Spacer(),
              VectorImage(
                svgAssetPath: AppAssets.eyeIcon,
                color: context.theme.primaryIconColor,
              ),
              const SizedBox(width: AppDimensions.large),
              VectorImage(
                svgAssetPath: AppAssets.dotIcon,
                color: context.theme.primaryIconColor,
              ),
            ],
          ),
          const PursesCard(),
        ].insertBetween(
          const SizedBox(
            height: AppDimensions.large,
          ),
        ),
      ),
    );
  }
}

class PursesCard extends StatelessWidget {
  const PursesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.large),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppAssets.turquoiseCard,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppDimensions.medium,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balance',
            style: context.themeData.textTheme.headlineLarge?.copyWith(
              // ignore: deprecated_member_use
              color: context.theme.bodyTextColor.withOpacity(.6),
              fontWeight: AppFonts.weightMedium,
            ),
          ),
          const SizedBox(height: AppDimensions.large),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              r'$ 3,124.02',
              style: context.themeData.textTheme.displayMedium?.copyWith(
                fontSize: AppFonts.sizeDisplayPreLarge,
                color: context.theme.bodyTextColor,
                fontWeight: AppFonts.weightSemiBold,
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.preLarge),
          Align(
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.bodyTextColor,
                  fontWeight: AppFonts.weightSemiBold,
                ),
                children: [
                  const TextSpan(
                    text: r'$10,000',
                  ),
                  const WidgetSpan(
                    child: SizedBox(width: AppDimensions.large),
                  ),
                  TextSpan(
                    text: 'Limit',
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color:
                          // ignore: deprecated_member_use
                          context.theme.bodyTextColor.withOpacity(.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.extraLarge),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Martines Guerirho',
              style: context.themeData.textTheme.headlineLarge?.copyWith(
                color: context.theme.bodyTextColor,
                fontWeight: AppFonts.weightSemiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
