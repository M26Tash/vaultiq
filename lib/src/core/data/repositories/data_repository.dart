import 'package:vaultiq/src/core/data/data_source/interfaces/i_data_source.dart';
import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';
import 'package:vaultiq/src/core/domain/interfaces/i_data_repository.dart';

final class DataRepository implements IDataRepository {
  final IDataSource _dataSource;

  DataRepository(this._dataSource);

  @override
  Stream<List<TransactionModel?>?> get transactionStream =>
      _dataSource.transactionStream;

  @override
  Stream<List<WalletModel?>?> get walletStream =>
      _dataSource.walletStream;

  @override
  Future<void> getTransactions() async {
    return _dataSource.getTransactions();
  }

  @override
  Future<void> getWallets() async {
    return _dataSource.getWallets();
  }

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    return _dataSource.addTransaction(transaction);
  }
}
