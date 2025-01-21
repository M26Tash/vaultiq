import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/core/data/repositories/auth_repository.dart';
import 'package:vaultiq/src/core/domain/interfaces/i_auth_repository.dart';

void initRepositories() {
  i.registerSingleton<IAuthRepository>(
    AuthRepository(
      i.get(),
    ),
  );
}
