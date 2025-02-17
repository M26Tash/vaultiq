import 'package:vaultiq/src/core/domain/entities/domain_object.dart';
import 'package:vaultiq/src/core/domain/entities/exchange_model/exchange_rate_model.dart';

final class ExchangeModel extends DomainObject {
  final String? result;
  final String? timeLastUpdateUtc;
  final String? timeNextUpdateUtc;
  final String? baseCurrencyCode;
  final List<ExchangeRateModel>? exchangeRates;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        result,
        timeLastUpdateUtc,
        timeNextUpdateUtc,
        baseCurrencyCode,
        exchangeRates,
      ];

  const ExchangeModel({
    this.result,
    this.timeLastUpdateUtc,
    this.timeNextUpdateUtc,
    this.baseCurrencyCode,
    this.exchangeRates,
  });

  @override
  ExchangeModel copyWith() {
    return ExchangeModel(
      result: result,
      timeLastUpdateUtc: timeLastUpdateUtc,
      timeNextUpdateUtc: timeNextUpdateUtc,
      baseCurrencyCode: baseCurrencyCode,
      exchangeRates: exchangeRates,
    );
  }

  ExchangeModel empty() {
    return const ExchangeModel();
  }
}