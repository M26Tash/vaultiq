import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/core/domain/entities/exchange_model/exchange_model.dart';
import 'package:vaultiq/src/core/domain/interactors/exchange_rate_interactor.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final ExchangeRateInteractor _exchangeRateInteractor;
  SplashCubit(this._exchangeRateInteractor)
      : super(
          SplashState(
            route: const CustomizedRoute(null, null),
            rates: const ExchangeModel().empty(),
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

  Future<void> getExchangeRate() async {
    return _exchangeRateInteractor.getExchangeRate();
  }

  void clearExchangeRate() {
    return _exchangeRateInteractor.clearExchangeRate();
  }

  void _onNewExchangeRate(ExchangeModel? rates) {
    emit(
      state.copyWith(
        rates: rates,
      ),
    );
  }
}
