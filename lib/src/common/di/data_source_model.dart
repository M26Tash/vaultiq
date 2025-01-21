import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/core/data/data_source/auth_data_source.dart';
import 'package:vaultiq/src/core/data/data_source/interfaces/i_auth_data_source.dart';

void initDataSource() {
  i.registerSingleton<IAuthDataSource>(
    AuthDataSource(),
  );
}
