import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/enum/wallet_type.dart';
import 'package:vaultiq/src/common/widgets/custom_tab_bar/custom_tab_bar.dart';
import 'package:vaultiq/src/common/widgets/custom_tab_bar/custom_tab_bar_body.dart';
import 'package:vaultiq/src/features/main/cubits/wallet_cubit/wallet_cubit.dart';
import 'package:vaultiq/src/features/main/widgets/wallet_body/widgets/wallet_items.dart';

class WalletBody extends StatefulWidget {
  const WalletBody({super.key});

  @override
  State<WalletBody> createState() => _WalletBodyState();
}

class _WalletBodyState extends State<WalletBody> {
  final _walletCubit = i.get<WalletCubit>();

  @override
  void initState() {
    super.initState();

    _walletCubit.getWallets();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();

    // return CubitScope<WalletCubit>(
    //   child: BlocBuilder<WalletCubit, WalletState>(
    //     builder: (context, state) {
    //       final cubit = CubitScope.of<WalletCubit>(context);
    //       if (state.wallets == null) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: context.theme.primaryColor,
    //           ),
    //         );
    //       }
    //       return CustomTabBarBody(
    //         currentTab: state.currentTab,
    //         tabItems: [
    //           TabItem(
    //             onTap: () => cubit.swapWalletTab(WalletType.wallet),
    //             tab: WalletType.wallet,
    //             title: 'Purses',
    //           ),
    //           TabItem(
    //             onTap: () => cubit.swapWalletTab(WalletType.card),
    //             tab: WalletType.card,
    //             title: 'Card',
    //           ),
    //         ],
    //         body: AnimatedSwitcher(
    //           duration: const Duration(milliseconds: 300),
    //           switchInCurve: Curves.easeIn,
    //           switchOutCurve: Curves.easeOut,
    //           child: state.wallets!.isNotEmpty
    //               ? WalletItems(
    //                   currentTab: state.currentTab,
    //                   wallets: state.wallets!,
    //                 )
    //               : Center(
    //                   child: Text(
    //                     'You do not have any wallets yet',
    //                     style: context.themeData.textTheme.headlineMedium
    //                         ?.copyWith(
    //                       color: context.theme.bodyTextColor,
    //                     ),
    //                   ),
    //                 ),
    //         ),
    //       );
    //     },
    //   ),
    // );
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
          
