import 'package:vaultiq/src/core/data/data_source/interfaces/i_exchange_rate_data_source.dart';
import 'package:vaultiq/src/core/domain/entities/exchange_model/exchange_model.dart';
import 'package:vaultiq/src/core/domain/interfaces/i_exchange_rate_repository.dart';

final class ExchangeRateRepository implements IExchangeRateRepository {
  final IExchangeRateDataSource _exchangeRateDataSource;

  const ExchangeRateRepository(this._exchangeRateDataSource);

  @override
  Stream<ExchangeModel?> get exchangeRateStream =>
      _exchangeRateDataSource.exchangeRateStream;

  @override
  Future<void> getExchangeRate() async {
    return _exchangeRateDataSource.getExchangeRate();
  }

  @override
  void clearExchangeRate() {
    return _exchangeRateDataSource.clearExchangeRate();
  }
}
