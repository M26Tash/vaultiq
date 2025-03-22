import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';
import 'package:vaultiq/src/core/domain/interfaces/i_data_repository.dart';

final class DataInteractor {
  final IDataRepository _dataRepository;

  DataInteractor(this._dataRepository);

  Stream<List<TransactionModel?>?> get transactionStream =>
      _dataRepository.transactionStream;

  Stream<List<WalletModel?>?> get walletStream => _dataRepository.walletStream;

  Future<void> getTransactions() async {
    return _dataRepository.getTransactions();
  }

  Future<void> getWallets() async {
    return _dataRepository.getWallets();
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    return _dataRepository.addTransaction(transaction);
  }
}
