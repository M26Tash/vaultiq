import 'package:vaultiq/src/core/domain/entities/domain_object.dart';

final class ExchangeRateModel extends DomainObject {
  final String currencyCode;
  final double rate;
  final bool isBaseCurrency;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        currencyCode,
        rate,
        isBaseCurrency,
      ];

  const ExchangeRateModel({
    required this.currencyCode,
    required this.rate,
    required this.isBaseCurrency,
  });

  @override
  ExchangeRateModel copyWith() {
    return ExchangeRateModel(
      currencyCode: currencyCode,
      rate: rate,
      isBaseCurrency: isBaseCurrency,
    );
  }
}
