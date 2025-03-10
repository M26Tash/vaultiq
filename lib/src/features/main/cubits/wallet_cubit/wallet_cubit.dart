import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/utils/enum/wallet_type.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';
import 'package:vaultiq/src/core/domain/interactors/data_interactor.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final DataInteractor _dataInteractor;
  WalletCubit(
    this._dataInteractor,
  ) : super(
          const WalletState(
            currentTab: WalletType.wallet,
            wallets: null,
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

  void _onNewWallet(List<WalletModel?>? wallets) {
    if (wallets!.isNotEmpty) {
      emit(
        state.copyWith(
          wallets: wallets,
        ),
      );
    }
  }

  void swapWalletTab(WalletType walletTab) {
    emit(
      state.copyWith(
        currentTab: walletTab,
      ),
    );
  }
}
