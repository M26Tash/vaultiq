import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/common/shared_cubits/navigation_panel_cubit/navigation_panel_cubit.dart';
import 'package:vaultiq/src/features/main/widgets/home_body/home_body.dart';
import 'package:vaultiq/src/features/main/widgets/more_body/more_body.dart';
import 'package:vaultiq/src/features/main/widgets/statistics_body/statistics_body.dart';
import 'package:vaultiq/src/features/main/widgets/wallet_body/wallet_body.dart';

class MainBodySelector extends StatefulWidget {
  final PageController pageController;
  // final EdgeInsets viewInsets;
  const MainBodySelector({
    required this.pageController,
    // required this.viewInsets,
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
          children: const [
            HomeBody(),
            StatisticsBody(),
            WalletBody(),
            MoreBody(),
          ],
        );
      },
    );
  }
}
