import 'package:vaultiq/src/common/utils/convertors/payment_method_convertor.dart';
import 'package:vaultiq/src/common/utils/convertors/wallet_type_convertor.dart';
import 'package:vaultiq/src/core/data/mappers/base_mapper.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';

final class WalletMapper implements BaseMapper<WalletModel> {
  @override
  Map<String, dynamic> toJson(WalletModel data) {
    return {
      _Fields.id: data.id,
      _Fields.userId: data.userId,
      _Fields.walletType: data.walletType,
      _Fields.walletName: data.walletName,
      _Fields.currencyCode: data.currencyCode,
      _Fields.balance: data.balance,
      _Fields.holderName: data.holderName,
      _Fields.validThru: data.validThru,
    };
  }

  @override
  WalletModel fromJson(Map<String, dynamic> json) {
    final walletType = json[_Fields.walletType];
    final cardPaymentMethod = json[_Fields.cardPaymentMethod];
    final balance = json[_Fields.balance];
    final limit = json[_Fields.limit];

    return WalletModel(
      id: json[_Fields.id],
      userId: json[_Fields.userId],
      walletType: WalletTypeConvertor.convertToEnum(
        walletType,
      ),
      cardPaymentMethod: cardPaymentMethod == null
          ? null
          : PaymentMethodConvertor.convertToEnum(
              cardPaymentMethod,
            ),
      walletName: json[_Fields.walletName],
      currencyCode: json[_Fields.currencyCode],
      balance: balance is int ? balance.toDouble() : balance,
      limit: limit is int ? limit.toDouble() : limit,
      holderName: json[_Fields.holderName],
      validThru: json[_Fields.validThru],
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String userId = 'user_id';
  static const String walletType = 'wallet_type';
  static const String cardPaymentMethod = 'card_payment_method';
  static const String walletName = 'wallet_name';
  static const String currencyCode = 'currency_code';
  static const String balance = 'balance';
  static const String limit = 'limit';
  static const String holderName = 'holder_name';
  static const String validThru = 'valid_thru';
}
