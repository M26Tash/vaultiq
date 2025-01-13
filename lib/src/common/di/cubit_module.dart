import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/common/shared_cubits/theme_cubit/theme_shared_cubit.dart';
import 'package:vaultiq/src/features/app/cubit/app_cubit.dart';

void initSharedCubits() {
  i.registerSingleton<ThemeSharedCubit>(
    ThemeSharedCubit(),
  );
}

void initCubits() {
  i.registerFactory<AppCubit>(
    () => AppCubit(
      i.get(),
    ),
  );
}
