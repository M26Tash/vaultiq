import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/common/shared_cubits/navigation_panel_cubit/navigation_panel_cubit.dart';
import 'package:vaultiq/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';
import 'package:vaultiq/src/features/main/widgets/home_body/home_body.dart';
import 'package:vaultiq/src/features/main/widgets/more_body/more_body.dart';
import 'package:vaultiq/src/features/main/widgets/statistics_body/statistics_body.dart';
import 'package:vaultiq/src/features/main/widgets/wallet_body/wallet_body.dart';

class MainBodySelector extends StatefulWidget {
  final PageController pageController;
  final ProfileModel profileModel;
  final List<TransactionModel>? transactions;
  final List<WalletModel>? wallets;
  final double totalBalance;
  final List<FlSpot> incomeSpots;
  final List<FlSpot> expenseSpots;
  const MainBodySelector({
    required this.pageController,
    required this.profileModel,
    required this.transactions,
    required this.wallets,
    required this.totalBalance,
    required this.incomeSpots,
    required this.expenseSpots,
    super.key,
  });

  @override
  State<MainBodySelector> createState() => _MainBodySelectorState();
}

class _MainBodySelectorState extends State<MainBodySelector> {
  final _navigationalPanelCubit = i.get<NavigationPanelCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPanelCubit, NavigationPanelState>(
      bloc: _navigationalPanelCubit,
      builder: (context, state) {
        return PageView(
          controller: widget.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomeBody(
              profileModel: widget.profileModel,
              transactions: widget.transactions,
              totalBalance: widget.totalBalance,
            ),
            const StatisticsBody(),
            WalletBody(
              wallets: widget.wallets,
            ),
            MoreBody(
              profileModel: widget.profileModel,
            ),
          ],
        );
      },
    );
  }
}
