import 'package:flutter/widgets.dart';
import 'package:vaultiq/src/common/constants/app_dimensions.dart';
import 'package:vaultiq/src/common/utils/enum/wallet_type.dart';
import 'package:vaultiq/src/common/utils/extensions/list_extension.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';
import 'package:vaultiq/src/features/main/widgets/wallet_body/widgets/wallet_item.dart';

class WalletItems extends StatelessWidget {
  final WalletType currentTab;
  final List<WalletModel?> wallets;
  const WalletItems({
    required this.currentTab,
    required this.wallets,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (final wallet in wallets)
          if (wallet!.walletType == currentTab)
            WalletItemSection(
              walletModel: wallet,
            ),
      ].insertBetween(
        const SizedBox(
          height: AppDimensions.large,
        ),
      ),
    );
  }
}
