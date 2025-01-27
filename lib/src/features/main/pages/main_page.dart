import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/shared_cubits/navigation_panel_cubit/navigation_panel_cubit.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:vaultiq/src/common/widgets/custom_navigation_panel/custom_navigation_panel.dart';
import 'package:vaultiq/src/features/main/widgets/add_dialog_item.dart';
import 'package:vaultiq/src/features/main/widgets/main_body_selector.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _navigationalPanelCubit = i.get<NavigationPanelCubit>();

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _navigationalPanelCubit.state.navigationIndex,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  void _listener(int? index) {
    if (index != null) _pageController.jumpToPage(index);
  }

  bool _listenWhen(
    NavigationPanelState prev,
    NavigationPanelState current,
  ) {
    return prev.navigationIndex != current.navigationIndex;
  }

  Future<void> showAddDialog({
    required BuildContext context,
    required List<AddDialogItem> items,
  }) async {
    showDialog(
      context: context,
      builder: (context) {
        return AddDialog(
          items: items,
        );
      },
    );
  }

  String? _appBarTitle(int pageIndex) => switch (pageIndex) {
        0 => null,
        1 => 'Statistics',
        2 => 'Wallet',
        3 => 'More',
        _ => null,
      };

  @override
  Widget build(BuildContext context) {
    return CubitScope<NavigationPanelCubit>(
      child: BlocConsumer<NavigationPanelCubit, NavigationPanelState>(
        listener: (context, state) => _listener(state.navigationIndex),
        listenWhen: _listenWhen,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: _appBarTitle(state.navigationIndex) == null
                ? null
                : CustomAppBar(
                    title: _appBarTitle(state.navigationIndex),
                  ),
            body: SafeArea(
              child: MainBodySelector(
                pageController: _pageController,
              ),
            ),
            bottomNavigationBar: CustomNavigationPanel(
              selectedIndex: state.navigationIndex,
              onIndexChanged: _navigationalPanelCubit.updateNavigationIndex,
              onAddTap: () => showAddDialog(
                context: context,
                items: [
                  AddDialogItem(
                    onTap: () {},
                    assetPath: AppAssets.newsIcon,
                    title: context.locale.news,
                    subtitle: context.locale.keepTrackOfNewChanges,
                  ),
                  AddDialogItem(
                    onTap: () {},
                    assetPath: AppAssets.incomeIcon,
                    title: context.locale.income,
                    subtitle: context.locale.recordYourIncomes,
                  ),
                  AddDialogItem(
                    onTap: () {},
                    assetPath: AppAssets.expenseIcon,
                    title: context.locale.expense,
                    subtitle: context.locale.knowWhereAndWhenYouSpend,
                  ),
                  AddDialogItem(
                    onTap: () {},
                    assetPath: AppAssets.transferIcon,
                    title: context.locale.transfer,
                    subtitle: context.locale.makeTransfersEasily,
                  ),
                  AddDialogItem(
                    onTap: () {},
                    assetPath: AppAssets.exchangeRateIcon,
                    title: context.locale.exchangeRate,
                    subtitle: context.locale.stayUpToDateEveryTime,
                  ),
                  AddDialogItem(
                    onTap: () {},
                    assetPath: AppAssets.cryptoRateIcon,
                    title: context.locale.cryptoRate,
                    subtitle: context.locale.beAwareOfFutureMoneyTendance,
                  ),
                ],
              ),
              items: const [
                CustomNavigationItem(
                  iconPath: AppAssets.homeIcon,
                ),
                CustomNavigationItem(
                  iconPath: AppAssets.statisticsIcon,
                ),
                CustomNavigationItem(
                  iconPath: AppAssets.walletIcon,
                ),
                CustomNavigationItem(
                  iconPath: AppAssets.moreIcon,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
