import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/core/data/data_source/auth_data_source.dart';
import 'package:vaultiq/src/core/data/data_source/data_source.dart';
import 'package:vaultiq/src/core/data/data_source/exchange_rate_data_source.dart';
import 'package:vaultiq/src/core/data/data_source/interfaces/i_auth_data_source.dart';
import 'package:vaultiq/src/core/data/data_source/interfaces/i_data_source.dart';
import 'package:vaultiq/src/core/data/data_source/interfaces/i_exchange_rate_data_source.dart';

void initDataSource() {
  i
    ..registerSingleton<IAuthDataSource>(
      AuthDataSource(),
    )
    ..registerSingleton<IExchangeRateDataSource>(
      ExchangeRateDataSource(),
    )
    ..registerSingleton<IDataSource>(
      DataSource(),
    );
}
