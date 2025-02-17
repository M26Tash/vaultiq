import 'package:vaultiq/src/core/data/mappers/base_mapper.dart';
import 'package:vaultiq/src/core/domain/entities/exchange_model/exchange_rate_model.dart';

final class ExchangeRateMapper implements BaseMapper<ExchangeRateModel> {
  @override
  Map<String, dynamic> toJson(ExchangeRateModel data) {
    return {
      _Fields.currencyCode: data.currencyCode,
      _Fields.rate: data.rate,
      _Fields.isBaseCurrency: data.isBaseCurrency,
    };
  }

  @override
  ExchangeRateModel fromJson(Map<String, dynamic> json) {
    final rate = json[_Fields.rate];
    return ExchangeRateModel(
      currencyCode: json[_Fields.currencyCode],
      rate: rate is int ? rate.toDouble() : rate,
      isBaseCurrency: json[_Fields.isBaseCurrency],
    );
  }
}

abstract final class _Fields {
  static const String currencyCode = 'currency_code';
  static const String rate = 'rate';
  static const String isBaseCurrency = 'is_base_currency';
}
