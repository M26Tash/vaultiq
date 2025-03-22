import 'package:vaultiq/src/common/utils/enum/wallet_type.dart';

abstract final class WalletTypeConvertor {
  static WalletType convertToEnum(String value) => switch (value) {
        'card' => WalletType.card,
        'wallet' => WalletType.wallet,
        _ => throw UnimplementedError('Invalid ENUM'),
      };
}
