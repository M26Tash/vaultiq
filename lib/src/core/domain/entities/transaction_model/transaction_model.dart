import 'package:vaultiq/src/common/utils/enum/transaction_type.dart';
import 'package:vaultiq/src/core/domain/entities/domain_object.dart';

final class TransactionModel extends DomainObject {
  final String? userId;
  final String walletId;
  final String createdAt;
  final String? updatedAt;
  final String transactionTitle;
  final TransactionType transactionType;
  final double defaultAmount;
  final String defaultCurrency;
  final double amountInUsd;
  final String? toWalletId;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        userId,
        walletId,
        createdAt,
        updatedAt,
        transactionTitle,
        transactionType,
        defaultAmount,
        defaultCurrency,
        amountInUsd,
        toWalletId,
      ];

  const TransactionModel({
    required this.walletId,
    required this.createdAt,
    required this.transactionTitle,
    required this.transactionType,
    required this.defaultAmount,
    required this.defaultCurrency,
    required this.amountInUsd,
    this.userId,
    this.updatedAt,
    this.toWalletId,
  });

  @override
  TransactionModel copyWith({
    String? userId,
  }) {
    return TransactionModel(
      userId: userId ?? this.userId,
      walletId: walletId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      transactionTitle: transactionTitle,
      transactionType: transactionType,
      defaultAmount: defaultAmount,
      defaultCurrency: defaultCurrency,
      amountInUsd: amountInUsd,
      toWalletId: toWalletId,
    );
  }
}
