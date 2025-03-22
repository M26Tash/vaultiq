import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';

abstract interface class IDataSource {
  Stream<List<TransactionModel?>?> get transactionStream;

  Stream<List<WalletModel?>?> get walletStream;

  Future<void> getTransactions();

  Future<void> getWallets();

  Future<void> addTransaction(TransactionModel transaction);
}
