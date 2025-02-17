import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rxdart/subjects.dart';
import 'package:vaultiq/src/core/data/data_source/interfaces/i_exchange_rate_data_source.dart';
import 'package:vaultiq/src/core/data/mappers/exchange_mapper/exchange_mapper.dart';
import 'package:vaultiq/src/core/domain/entities/exchange_model/exchange_model.dart';
import 'package:vaultiq/src/core/domain/utils/core_logger.dart';

class ExchangeRateDataSource implements IExchangeRateDataSource {
  final BehaviorSubject<ExchangeModel?> _exchangeRateSubject =
      BehaviorSubject();

  ExchangeModel? _cachedExchangeRate;

  @override
  Stream<ExchangeModel?> get exchangeRateStream => _exchangeRateSubject;

  @override
  Future<void> getExchangeRate() async {
    if (_cachedExchangeRate != null) {
      _exchangeRateSubject.add(_cachedExchangeRate);
      CoreLogger.warningLog('Serving cached exchange rate');
    }

    // try {
    //   final url = Uri(
    //     scheme: ServiceCredential.scheme,
    //     host: ServiceCredential.host,
    //     path: ServiceCredential.path,
    //   );

    //   final response = await http.get(url);

    //   if (response.statusCode == 200) {
    //     final Map<String, dynamic> responseMap = jsonDecode(response.body);

    //     final exchangeRate = ExchangeMapper().fromJson(responseMap);

    //     _cachedExchangeRate = exchangeRate;

    //     _exchangeRateSubject.add(exchangeRate);

    //     CoreLogger.warningLog('Exchange Rate Initialized');
    //   } else {
    //     CoreLogger.errorLog(
    //       'getExchangeRate()',
    //       params: {
    //         'HTTP Error': 'Status code: ${response.statusCode}',
    //       },
    //     );
    //     _exchangeRateSubject.add(
    //       const ExchangeModel(
    //         result: 'fail',
    //         timeLastUpdateUtc: 'timeLastUpdateUtc',
    //         timeNextUpdateUtc: 'timeNextUpdateUtc',
    //         baseCurrencyCode: 'baseCurrencyCode',
    //         exchangeRates: [],
    //       ),
    //     );
    //   }
    // } on HttpException catch (e) {
    //   CoreLogger.errorLog(
    //     'getExchangeRate()',
    //     params: {
    //       'Caught error': e.message,
    //     },
    //   );
    // }
  }

  @override
  void clearExchangeRate() {
    _cachedExchangeRate = const ExchangeModel(result: 'cleared');
    _exchangeRateSubject.add(const ExchangeModel(result: 'cleared'));
  }
}
