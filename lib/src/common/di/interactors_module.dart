import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/core/domain/interactors/auth_interactor.dart';

void initInteractors() {
  i.registerSingleton<AuthInteractor>(
    AuthInteractor(
      i.get(),
    ),
  );
}
