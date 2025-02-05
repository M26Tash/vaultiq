import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/utils/enum/wallet_tab.dart';
import 'package:vaultiq/src/common/widgets/custom_tab_bar/custom_tab_bar.dart';
import 'package:vaultiq/src/common/widgets/custom_tab_bar/custom_tab_bar_body.dart';
import 'package:vaultiq/src/features/main/cubits/wallet_cubit/wallet_cubit.dart';
import 'package:vaultiq/src/features/main/widgets/wallet_body/widgets/card_body.dart';
import 'package:vaultiq/src/features/main/widgets/wallet_body/widgets/purses_body.dart';

class WalletBody extends StatelessWidget {
  const WalletBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<WalletCubit>(
      child: BlocBuilder<WalletCubit, WalletState>(
        builder: (context, state) {
          final cubit = CubitScope.of<WalletCubit>(context);
          return CustomTabBarBody(
            currentTab: state.currentTab,
            tabItems: [
              TabItem(
                onTap: () => cubit.swapWalletTab(WalletTab.purses),
                tab: WalletTab.purses,
                title: 'Purses',
              ),
              TabItem(
                onTap: () => cubit.swapWalletTab(WalletTab.card),
                tab: WalletTab.card,
                title: 'Card',
              ),
            ],
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child: state.currentTab == WalletTab.purses
                  ? const PursesBody()
                  : const CardBody(),
            ),
          );
        },
      ),
    );
  }
}


 // return ListView(
          //   padding: const EdgeInsets.all(AppDimensions.large),
          //   children: <Widget>[
          //     CustomTabBar(
          //       currentTab: state.currentTab,
          //       tabItems: [
                  // TabItem(
                  //   onTap: () => cubit.swapWalletTab(WalletTab.wallet),
                  //   tab: WalletTab.wallet,
                  //   title: 'Wallet',
                  // ),
                  // TabItem(
                  //   onTap: () => cubit.swapWalletTab(WalletTab.card),
                  //   tab: WalletTab.card,
                  //   title: 'Card',
                  // ),
          //       ],
          //     ),
          //     // const BankCard(),
          //     const BankCardSection(),
          //   ].insertBetween(
          //     const SizedBox(
          //       height: AppDimensions.large,
          //     ),
          //   ),
          // );
          
