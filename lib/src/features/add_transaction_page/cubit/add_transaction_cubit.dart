import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';
import 'package:vaultiq/src/core/domain/interactors/data_interactor.dart';

part 'add_transaction_state.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  final DataInteractor _dataInteractor;
  AddTransactionCubit(
    this._dataInteractor,
  ) : super(
          const AddTransactionState(
            route: CustomizedRoute(
              null,
              null,
            ),
            currency: 'USD',
            wallets: null,
            selectedNormalWallet: null,
            selectedToWallet: null,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<WalletModel?>?>? _walletSubscription;

  @override
  Future<void> close() {
    _walletSubscription?.cancel();
    _walletSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _walletSubscription?.cancel();
    _walletSubscription = _dataInteractor.walletStream.listen(
      _onNewWallet,
    );
  }

  Future<void> getWallets() async {
    return _dataInteractor.getWallets();
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    return _dataInteractor.addTransaction(transaction);
  }

  void selectNormalWallet(WalletModel wallet) {
    emit(
      state.copyWith(
        selectedNormalWallet: wallet,
      ),
    );
  }

  void selectToWallet(WalletModel wallet) {
    emit(
      state.copyWith(
        selectedToWallet: wallet,
      ),
    );
  }

  void _onNewWallet(List<WalletModel?>? wallets) {
    emit(
      state.copyWith(
        wallets: wallets,
      ),
    );
  }

  void navigateBack() {
    emit(
      state.copyWith(
        route: const CustomizedRoute.pop(),
      ),
    );
  }
}
