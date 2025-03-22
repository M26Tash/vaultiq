import 'package:vaultiq/src/common/utils/enum/payment_method.dart';
import 'package:vaultiq/src/common/utils/enum/wallet_type.dart';
import 'package:vaultiq/src/core/domain/entities/domain_object.dart';

final class WalletModel extends DomainObject {
  final String id;
  final String userId;
  final WalletType walletType;
  final PaymentMethod? cardPaymentMethod;
  final String walletName;
  final String currencyCode;
  final double balance;
  final double limit;
  final String holderName;
  final String? validThru;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        userId,
        walletType,
        walletName,
        currencyCode,
        balance,
        limit,
        holderName,
        cardPaymentMethod,
        validThru,
      ];

  const WalletModel({
    required this.id,
    required this.userId,
    required this.walletType,
    required this.walletName,
    required this.currencyCode,
    required this.balance,
    required this.limit,
    required this.holderName,
    this.cardPaymentMethod,
    this.validThru,
  });

  @override
  WalletModel copyWith() {
    return WalletModel(
      id: id,
      userId: userId,
      walletType: walletType,
      walletName: walletName,
      currencyCode: currencyCode,
      balance: balance,
      limit: limit,
      holderName: holderName,
      cardPaymentMethod: cardPaymentMethod,
      validThru: validThru,
    );
  }
}
