import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';
import 'package:vaultiq/src/features/main/widgets/home_body/transaction_item.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late final DraggableScrollableController _draggableScrollableController;

  @override
  void initState() {
    super.initState();

    _draggableScrollableController = DraggableScrollableController();
  }

  @override
  void dispose() {
    super.dispose();

    _draggableScrollableController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(AppDimensions.large),
          children: [
            Row(
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
                      style:
                          context.themeData.textTheme.headlineSmall?.copyWith(
                        color: context.theme.hintTextColor,
                        fontWeight: AppFonts.weightMedium,
                      ),
                    ),
                    Text(
                      'Muhammed',
                      style:
                          context.themeData.textTheme.headlineLarge?.copyWith(
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
            ),
            const SizedBox(height: AppDimensions.extraLarge),
            //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Balance',
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    color: context.theme.hintTextColor,
                    fontWeight: AppFonts.weightRegular,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppDimensions.medium,
                    horizontal: AppDimensions.large,
                  ),
                  decoration: BoxDecoration(
                    color: context.theme.cardBackgroundColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        AppDimensions.superLarge,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      VectorImage(
                        svgAssetPath: AppAssets.statisticsIcon,
                        color: context.theme.primaryIconColor,
                      ),
                      const SizedBox(width: AppDimensions.medium),
                      Text(
                        'Statistics',
                        style:
                            context.themeData.textTheme.headlineSmall?.copyWith(
                          color: context.theme.bodyTextColor,
                          fontWeight: AppFonts.weightRegular,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.medium),
            // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: r'$ ',
                    style: context.themeData.textTheme.displayLarge?.copyWith(
                      fontSize: AppFonts.currencySignSizeFont,
                      fontWeight: AppFonts.weightSemiBold,
                      color: context.theme.currencySignColor,
                    ),
                  ),
                  TextSpan(
                    text: '1,000,347.12',
                    style: context.themeData.textTheme.displayLarge?.copyWith(
                      fontSize: AppFonts.balanceSizeFont,
                      fontWeight: AppFonts.weightBold,
                      color: context.theme.bodyTextColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.extraLarge),
            // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.large,
                vertical: AppDimensions.large,
              ),
              decoration: BoxDecoration(
                color: context.theme.cardBackgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    AppDimensions.superLarge,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      VectorImage(
                        svgAssetPath: AppAssets.transferIcon,
                        color: context.theme.primaryIconColor,
                      ),
                      const SizedBox(width: AppDimensions.medium),
                      Text(
                        'Transfer',
                        style: context.themeData.textTheme.headlineMedium
                            ?.copyWith(
                          color: context.theme.bodyTextColor,
                          fontWeight: AppFonts.weightRegular,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '|',
                    style: context.themeData.textTheme.displayMedium?.copyWith(
                      color: context.theme.overlayBackgroundColor,
                      fontWeight: AppFonts.weightRegular,
                    ),
                  ),
                  Row(
                    children: [
                      VectorImage(
                        svgAssetPath: AppAssets.expenseIcon,
                        color: context.theme.primaryIconColor,
                      ),
                      const SizedBox(width: AppDimensions.medium),
                      Text(
                        'Expense',
                        style: context.themeData.textTheme.headlineMedium
                            ?.copyWith(
                          color: context.theme.bodyTextColor,
                          fontWeight: AppFonts.weightRegular,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.extraLarge),
            // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppDimensions.large),
                  decoration: BoxDecoration(
                    color: context.theme.cardBackgroundColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        AppDimensions.large,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundColor: context.theme.overlayBackgroundColor,
                        radius: 24,
                        child: Text(
                          '🤑',
                          style: context.themeData.textTheme.displayMedium,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.medium),
                      Text(
                        'Get plan',
                        style: context.themeData.textTheme.headlineMedium
                            ?.copyWith(
                          color: context.theme.bodyTextColor,
                          fontWeight: AppFonts.weightRegular,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppDimensions.large),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(AppDimensions.large),
                    decoration: BoxDecoration(
                      color: context.theme.transferCardBackgroundColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          AppDimensions.large,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recent Transaction',
                          style: context.themeData.textTheme.headlineMedium
                              ?.copyWith(
                            color: context.theme.bodyTextColor,
                            fontWeight: AppFonts.weightRegular,
                          ),
                        ),
                        const SizedBox(height: AppDimensions.preLarge),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < 5; i++)
                              CircleAvatar(
                                backgroundColor:
                                    context.theme.cardBackgroundColor,
                                child: Text(
                                  String.fromCharCode(65 + i),
                                  style: context
                                      .themeData.textTheme.headlineMedium
                                      ?.copyWith(
                                    color: context.theme.bodyTextColor,
                                    fontWeight: AppFonts.weightRegular,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        DraggableScrollableSheet(
          controller: _draggableScrollableController,
          minChildSize: 0.4,
          initialChildSize: 0.4,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(AppDimensions.large),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: context.theme.cardBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                    AppDimensions.extraLarge,
                  ),
                  topRight: Radius.circular(
                    AppDimensions.extraLarge,
                  ),
                ),
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Center(
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
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: AppDimensions.large,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Text(
                      'Transactions',
                      style:
                          context.themeData.textTheme.headlineLarge?.copyWith(
                        color: context.theme.bodyTextColor,
                        fontWeight: AppFonts.weightBold,
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: AppDimensions.medium,
                    ),
                  ),
                  for (int i = 0; i < 7; i++)
                    const SliverToBoxAdapter(
                      child: TransactionItem(
                        assetPath: '',
                        title: 'ChatGPT Subscription',
                        date: '27.01.2025 17:20',
                        amount: '1,070.00',
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
