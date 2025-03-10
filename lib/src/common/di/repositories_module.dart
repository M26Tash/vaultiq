import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/core/data/repositories/auth_repository.dart';
import 'package:vaultiq/src/core/data/repositories/data_repository.dart';
import 'package:vaultiq/src/core/data/repositories/exchange_rate_repository.dart';
import 'package:vaultiq/src/core/domain/interfaces/i_auth_repository.dart';
import 'package:vaultiq/src/core/domain/interfaces/i_data_repository.dart';
import 'package:vaultiq/src/core/domain/interfaces/i_exchange_rate_repository.dart';

void initRepositories() {
  i
    ..registerSingleton<IAuthRepository>(
      AuthRepository(
        i.get(),
      ),
    )
    ..registerSingleton<IExchangeRateRepository>(
      ExchangeRateRepository(
        i.get(),
      ),
    )
    ..registerSingleton<IDataRepository>(
      DataRepository(
        i.get(),
      ),
    );
}
