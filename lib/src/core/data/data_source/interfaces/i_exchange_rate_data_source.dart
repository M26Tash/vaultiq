import 'package:vaultiq/src/core/domain/entities/exchange_model/exchange_model.dart';

abstract interface class IExchangeRateDataSource {
  Stream<ExchangeModel?> get exchangeRateStream;

  Future<void> getExchangeRate();

  void clearExchangeRate();
}
