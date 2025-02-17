import 'package:vaultiq/src/core/domain/entities/exchange_model/exchange_model.dart';

abstract interface class IExchangeRateRepository {
  Stream<ExchangeModel?> get exchangeRateStream;

  Future<void> getExchangeRate();

  void clearExchangeRate();
}
