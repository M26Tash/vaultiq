import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/core/domain/interactors/auth_interactor.dart';
import 'package:vaultiq/src/core/domain/interactors/data_interactor.dart';
import 'package:vaultiq/src/core/domain/interactors/exchange_rate_interactor.dart';
import 'package:vaultiq/src/core/domain/interactors/file_interactor.dart';
import 'package:vaultiq/src/core/domain/interactors/local_auth_interactor.dart';
import 'package:vaultiq/src/core/domain/interactors/local_data_interactor.dart';

void initInteractors() {
  i
    ..registerSingleton<AuthInteractor>(
      AuthInteractor(
        i.get(),
      ),
    )
    ..registerSingleton<LocalDataInteractor>(
      LocalDataInteractor(
        i.get(),
      ),
    )
    ..registerSingleton<ExchangeRateInteractor>(
      ExchangeRateInteractor(
        i.get(),
      ),
    )
    ..registerSingleton<DataInteractor>(
      DataInteractor(
        i.get(),
      ),
    )
    ..registerSingleton<LocalAuthInteractor>(
      LocalAuthInteractor(
        i.get(),
      ),
    )
    ..registerSingleton<FileInteractor>(
      FileInteractor(
        i.get(),
      ),
    );
}
