import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/core/domain/entities/exchange_model/exchange_model.dart';
import 'package:vaultiq/src/core/domain/interactors/exchange_rate_interactor.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ExchangeRateInteractor _exchangeRateInteractor;
  HomeCubit(
    this._exchangeRateInteractor,
  ) : super(
          const HomeState(
            rates: ExchangeModel(),
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<ExchangeModel?>? _exchangeRateSubscription;

  @override
  Future<void> close() {
    _exchangeRateSubscription?.cancel();
    _exchangeRateSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _exchangeRateSubscription?.cancel();
    _exchangeRateSubscription =
        _exchangeRateInteractor.exchangeRateStream.listen(
      _onNewExchangeRate,
    );
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

  void _onNewExchangeRate(ExchangeModel? rates) {
    emit(
      state.copyWith(
        rates: rates,
      ),
    );
  }
}
