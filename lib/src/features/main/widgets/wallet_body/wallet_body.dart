import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/enum/wallet_type.dart';
import 'package:vaultiq/src/common/widgets/custom_tab_bar/custom_tab_bar.dart';
import 'package:vaultiq/src/common/widgets/custom_tab_bar/custom_tab_bar_body.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';
import 'package:vaultiq/src/features/main/cubits/wallet_cubit/wallet_cubit.dart';
import 'package:vaultiq/src/features/main/widgets/wallet_body/widgets/wallet_items.dart';

class WalletBody extends StatelessWidget {
  final List<WalletModel>? wallets;
  const WalletBody({
    required this.wallets,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CubitScope<WalletCubit>(
      child: BlocBuilder<WalletCubit, WalletState>(
        builder: (context, state) {
          final cubit = CubitScope.of<WalletCubit>(context);
          if (wallets == null) {
            return Center(
              child: CircularProgressIndicator(
                color: context.theme.primaryColor,
              ),
            );
          }
          return CustomTabBarBody(
            currentTab: state.currentTab,
            tabItems: [
              TabItem(
                onTap: () => cubit.swapWalletTab(WalletType.wallet),
                tab: WalletType.wallet,
                title: 'Purses',
              ),
              TabItem(
                onTap: () => cubit.swapWalletTab(WalletType.card),
                tab: WalletType.card,
                title: 'Card',
              ),
            ],
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child: wallets!.isNotEmpty
                  ? WalletItems(
                      currentTab: state.currentTab,
                      wallets: wallets!,
                    )
                  : Center(
                      child: Text(
                        'You do not have any wallets yet',
                        style: context.themeData.textTheme.headlineMedium
                            ?.copyWith(
                          color: context.theme.bodyTextColor,
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
