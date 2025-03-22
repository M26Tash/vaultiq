import 'package:vaultiq/src/common/utils/convertors/transaction_type_convertor.dart';
import 'package:vaultiq/src/core/data/mappers/base_mapper.dart';
import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';

final class TransactionMapper implements BaseMapper<TransactionModel> {
  @override
  Map<String, dynamic> toJson(TransactionModel data) {
    return {
      _Fields.userId: data.userId,
      _Fields.walletId: data.walletId,
      _Fields.createdAt: data.createdAt,
      _Fields.updatedAt: data.updatedAt,
      _Fields.transactionTitle: data.transactionTitle,
      _Fields.transactionType: TransactionTypeConvertor.convertToString(
        data.transactionType,
      ),
      _Fields.defaultAmount: data.defaultAmount,
      _Fields.defaultCurrency: data.defaultCurrency,
      _Fields.amountInUsd: data.amountInUsd,
      _Fields.toWalletId: data.toWalletId,
    };
  }

  @override
  TransactionModel fromJson(Map<String, dynamic> json) {
    final defaultAmount = json[_Fields.defaultAmount];
    final amountInUsd = json[_Fields.amountInUsd];
    final transactionType = json[_Fields.transactionType];

    return TransactionModel(
      userId: json[_Fields.userId],
      walletId: json[_Fields.walletId],
      createdAt: json[_Fields.createdAt],
      updatedAt: json[_Fields.updatedAt],
      transactionTitle: json[_Fields.transactionTitle],
      transactionType: TransactionTypeConvertor.convertToEnum(transactionType),
      defaultAmount:
          defaultAmount is int ? defaultAmount.toDouble() : defaultAmount,
      defaultCurrency: json[_Fields.defaultCurrency],
      amountInUsd: amountInUsd is int ? amountInUsd.toDouble() : amountInUsd,
      toWalletId: json[_Fields.toWalletId],
    );
  }
}

abstract final class _Fields {
  static const String userId = 'user_id';
  static const String walletId = 'wallet_id';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
  static const String transactionTitle = 'transaction_title';
  static const String transactionType = 'transaction_type';
  static const String defaultAmount = 'default_amount';
  static const String defaultCurrency = 'default_currency';
  static const String amountInUsd = 'amount_in_usd';
  static const String toWalletId = 'to_wallet_id';
}
