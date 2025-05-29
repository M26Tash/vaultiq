import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/core/domain/entities/exchange_model/exchange_model.dart';
import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';
import 'package:vaultiq/src/core/domain/interactors/data_interactor.dart';
import 'package:vaultiq/src/core/domain/interactors/exchange_rate_interactor.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ExchangeRateInteractor _exchangeRateInteractor;
  final DataInteractor _dataInteractor;

  HomeCubit(
    this._exchangeRateInteractor,
    this._dataInteractor,
  ) : super(
          const HomeState(
            rates: ExchangeModel(),
            wallets: null,
            totalBalance: 0,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<ExchangeModel?>? _exchangeRateSubscription;
  StreamSubscription<List<WalletModel?>?>? _walletSubscription;

  @override
  Future<void> close() {
    _exchangeRateSubscription?.cancel();
    _exchangeRateSubscription = null;

    _walletSubscription?.cancel();
    _walletSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _exchangeRateSubscription?.cancel();
    _exchangeRateSubscription =
        _exchangeRateInteractor.exchangeRateStream.listen(
      _onNewExchangeRate,
    );

    _walletSubscription?.cancel();
    _walletSubscription = _dataInteractor.walletStream.listen(
      _onNewWallets,
    );
  }


  Future<void> getWallets() async {
    return _dataInteractor.getWallets();
  }


  String convert(String currencyCode, double amount, String convertCode) {
    final actualCurrency = state.rates.exchangeRates?.firstWhere(
      (rate) => rate.currencyCode == currencyCode,
    );
    final neededCurrency = state.rates.exchangeRates?.firstWhere(
      (rate) => rate.currencyCode == convertCode,
    );

    final convertedAmount =
        ((amount / actualCurrency!.rate) * neededCurrency!.rate)
            .toStringAsFixed(2);

    return convertedAmount;
  }

  void navigateToTransferPage() {
    emit(
      state.copyWith(),
    );
  }

  void _onNewExchangeRate(ExchangeModel? rates) {
    emit(
      state.copyWith(
        rates: rates,
      ),
    );
  }

  void _onNewWallets(List<WalletModel?>? wallets) {
    double balance = 0;

    emit(
      state.copyWith(
        wallets: wallets,
      ),
    );

    if (wallets?.first != null) {
      if (wallets?.length == 1) {
        emit(
          state.copyWith(
            totalBalance: wallets?.first?.balance,
          ),
        );
      }

      if (wallets!.length > 1) {
        for (final wallet in wallets) {
          balance += wallet!.balance;
        }
        emit(
          state.copyWith(totalBalance: balance),
        );
      }
    }
    // if (wallets!.isNotEmpty) {
    //   if (wallets.length == 1) {
    //     emit(
    //       state.copyWith(
    //         totalBalance: wallets.first!.balance,
    //       ),
    //     );
    //   }

    //   if (wallets.length > 1) {
    //     for (final wallet in wallets) {
    //       balance += wallet!.balance;
    //     }
    //     emit(
    //       state.copyWith(totalBalance: balance),
    //     );
    //   }
    // if (transactions!.isNotEmpty) {
    //   for (final element in transactions) {
    //     if (element.transactionType == TransactionType.income) {
    //       balance += element.defaultAmount;
    //     } else if (element.transactionType == TransactionType.expense) {
    //       balance -= element.defaultAmount;
    //     }
    //   }

    //   emit(
    //     state.copyWith(
    //       transactions: transactions,
    //       totalBalance: double.parse(balance.toStringAsFixed(2)),
    //     ),
    //   );
    // }
  }
}
