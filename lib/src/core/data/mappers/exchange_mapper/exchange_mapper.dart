import 'package:vaultiq/src/core/data/mappers/base_mapper.dart';
import 'package:vaultiq/src/core/data/mappers/exchange_mapper/exchange_rate_mapper.dart';
import 'package:vaultiq/src/core/domain/entities/exchange_model/exchange_model.dart';

final class ExchangeMapper implements BaseMapper<ExchangeModel> {
  @override
  Map<String, dynamic> toJson(ExchangeModel data) {
    return {
      _Fields.result: data.result,
      _Fields.timeLastUpdateUtc: data.timeLastUpdateUtc,
      _Fields.timeNextUpdateUtc: data.timeNextUpdateUtc,
      _Fields.baseCurrencyCode: data.baseCurrencyCode,
      _Fields.exchangeRates: data.exchangeRates,
    };
  }

  @override
  ExchangeModel fromJson(Map<String, dynamic> json) {
    final exchangeRates = json[_Fields.exchangeRates];
    return ExchangeModel(
      result: json[_Fields.result],
      timeLastUpdateUtc: json[_Fields.timeLastUpdateUtc],
      timeNextUpdateUtc: json[_Fields.timeNextUpdateUtc],
      baseCurrencyCode: json[_Fields.baseCurrencyCode],
      exchangeRates: exchangeRates is List<dynamic>
          ? exchangeRates.map((e) => ExchangeRateMapper().fromJson(e)).toList()
          : [
              ExchangeRateMapper().fromJson(exchangeRates),
            ],
    );
  }
}

abstract final class _Fields {
  static const String result = 'result';
  static const String timeLastUpdateUtc = 'time_last_update_utc';
  static const String timeNextUpdateUtc = 'time_next_update_utc';
  static const String baseCurrencyCode = 'base_currency_code';
  static const String exchangeRates = 'exchange_rates';
}
