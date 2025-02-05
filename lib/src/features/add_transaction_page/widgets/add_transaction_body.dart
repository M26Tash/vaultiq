import 'package:flutter/widgets.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/extensions/list_extension.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';

class AddTransactionBody extends StatelessWidget {
  final String currency;
  const AddTransactionBody({
    required this.currency,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.large,
                horizontal: AppDimensions.extraLarge,
              ),
              decoration: BoxDecoration(
                color: context.theme.cardBackgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    AppDimensions.preLarge,
                  ),
                ),
                border: Border.all(
                  color: context.theme.primaryColor,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Sender',
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.bodyTextColor,
                    ),
                  ),
                ],
              ),
            ),
            VectorImage(
              svgAssetPath: AppAssets.longArrowRightIcon,
              color: context.theme.primaryIconColor,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.large,
                horizontal: AppDimensions.extraLarge,
              ),
              decoration: BoxDecoration(
                color: context.theme.cardBackgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    AppDimensions.preLarge,
                  ),
                ),
                border: Border.all(
                  color: context.theme.primaryColor,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Receiver',
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.bodyTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(AppDimensions.large),
                decoration: BoxDecoration(
                  color: context.theme.cardBackgroundColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (r'$' == currency)
                      Text(
                        r'$ 1,000',
                        style:
                            context.themeData.textTheme.headlineLarge?.copyWith(
                          fontSize: AppFonts.sizeHeadlinePreLarge,
                          color: context.theme.bodyTextColor,
                          fontWeight: AppFonts.weightSemiBold,
                        ),
                      ),
                    if (r'$' != currency)
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '₺ 35,880',
                              style: context.themeData.textTheme.headlineLarge
                                  ?.copyWith(
                                fontSize: AppFonts.sizeHeadlinePreLarge,
                                color: context.theme.bodyTextColor,
                                fontWeight: AppFonts.weightSemiBold,
                              ),
                            ),
                            const WidgetSpan(
                              child: SizedBox(
                                width: AppDimensions.medium,
                              ),
                            ),
                            TextSpan(
                              text: r'~ $ 1,000',
                              style: context.themeData.textTheme.headlineMedium
                                  ?.copyWith(
                                color: context.theme.hintTextColor,
                                fontWeight: AppFonts.weightSemiBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ].insertBetween(
        const SizedBox(
          height: AppDimensions.extraLarge,
        ),
      ),
    );
  }
}
