// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/constants/app_fonts.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/enum/wallet_selection_type.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';
import 'package:vaultiq/src/features/add_transaction_page/cubit/add_transaction_cubit.dart';

class WalletSelection extends StatelessWidget {
  final AddTransactionCubit cubit;
  final List<WalletModel?> wallets;
  final WalletModel wallet;
  final WalletModel? selectedWallet;
  final WalletSelectionType walletSelectionType;
  const WalletSelection({
    required this.cubit,
    required this.wallets,
    required this.wallet,
    required this.selectedWallet,
    required this.walletSelectionType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          AppDimensions.medium,
        ),
      ),
      onTap: () {
        if (walletSelectionType == WalletSelectionType.normal) {
          cubit.selectNormalWallet(wallet);
        }
       
        if (walletSelectionType == WalletSelectionType.to) {
          cubit.selectToWallet(wallet);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(AppDimensions.large),
        decoration: BoxDecoration(
          color: selectedWallet == wallet
              ? context.theme.primaryColor
              : Colors.teal,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppDimensions.medium,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: selectedWallet == wallet
                  ? context.theme.accentColor
                  : Colors.teal.shade200,
              child: Text(
                NumberFormat.simpleCurrency(name: wallet.currencyCode)
                    .currencySymbol,
                style: context.themeData.textTheme.headlineLarge?.copyWith(
                  color: context.theme.bodyTextColor,
                  fontWeight: AppFonts.weightBold,
                ),
              ),
            ),
            Text(
              'Balance',
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                color: context.theme.subTextColor,
                fontWeight: AppFonts.weightRegular,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${wallet.balance}',
              style: context.themeData.textTheme.headlineLarge?.copyWith(
                color: context.theme.bodyTextColor,
                fontWeight: AppFonts.weightBold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              wallet.holderName,
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                color: context.theme.bodyTextColor,
                fontWeight: AppFonts.weightBold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
