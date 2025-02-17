import 'package:vaultiq/src/core/domain/entities/exchange_model/exchange_model.dart';
import 'package:vaultiq/src/core/domain/interfaces/i_exchange_rate_repository.dart';

final class ExchangeRateInteractor {
  final IExchangeRateRepository _exchangeRateRepository;

  const ExchangeRateInteractor(this._exchangeRateRepository);

  Stream<ExchangeModel?> get exchangeRateStream =>
      _exchangeRateRepository.exchangeRateStream;

  Future<void> getExchangeRate() async {
    return _exchangeRateRepository.getExchangeRate();
  }

  void clearExchangeRate() {
    return _exchangeRateRepository.clearExchangeRate();
  }
}
