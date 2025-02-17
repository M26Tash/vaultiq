import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/vector_image/vector_image.dart';
import 'package:vaultiq/src/features/main/cubits/home_cubit/home_cubit.dart';
import 'package:vaultiq/src/features/main/widgets/home_body/widgets/current_balance.dart';
import 'package:vaultiq/src/features/main/widgets/home_body/widgets/home_header.dart';
import 'package:vaultiq/src/features/main/widgets/home_body/widgets/home_scrollable_sheet.dart';
import 'package:vaultiq/src/features/main/widgets/home_body/widgets/recent_transfers_and_plan.dart';
import 'package:vaultiq/src/features/main/widgets/home_body/widgets/transaction_action.dart';

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
    return CubitScope<HomeCubit>(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = CubitScope.of<HomeCubit>(context);
          if (state.rates.result == null) {
            return Center(
              child: CircularProgressIndicator(
                color: context.theme.primaryColor,
              ),
            );
          }
          return Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(AppDimensions.large),
                children: [
                  const HomeHeader(),
                  const SizedBox(height: AppDimensions.extraLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Balance',
                        style: context.themeData.textTheme.headlineMedium
                            ?.copyWith(
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
                              style: context.themeData.textTheme.headlineSmall
                                  ?.copyWith(
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
                  CurrentBalance(
                    balance: cubit.convert('TRY', 300000, 'USD'),
                  ),
                  const SizedBox(height: AppDimensions.extraLarge),
                  TransactionAction(
                    onTransferTap: () {},
                    onExpenseTap: () {},
                  ),
                  const SizedBox(height: AppDimensions.extraLarge),
                  RecentTransfersAndPlan(
                    onGetPlanTap: () {},
                  ),
                ],
              ),
              DraggableScrollableSheet(
                controller: _draggableScrollableController,
                minChildSize: 0.4,
                initialChildSize: 0.4,
                builder: (context, scrollController) {
                  return HomeScrollableSheet(
                    scrollController: scrollController,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
