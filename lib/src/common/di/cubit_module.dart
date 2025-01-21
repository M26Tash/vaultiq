import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/common/shared_cubits/theme_cubit/theme_shared_cubit.dart';
import 'package:vaultiq/src/features/app/cubit/app_cubit.dart';
import 'package:vaultiq/src/features/authentication_page/cubit/auth_cubit.dart';
import 'package:vaultiq/src/features/default_currency_page/cubit/default_currency_cubit.dart';
import 'package:vaultiq/src/features/forgot_password_page/cubit/forgot_password_cubit.dart';
import 'package:vaultiq/src/features/home_page/cubit/home_cubit.dart';
import 'package:vaultiq/src/features/otp_page/cubit/otp_cubit.dart';

void initSharedCubits() {
  i.registerSingleton<ThemeSharedCubit>(
    ThemeSharedCubit(),
  );
}

void initCubits() {
  i
    ..registerFactory<AppCubit>(
      () => AppCubit(
        i.get(),
      ),
    )
    ..registerFactory<AuthCubit>(
      () => AuthCubit(
        i.get(),
      ),
    )
    ..registerFactory<ForgotPasswordCubit>(
      () => ForgotPasswordCubit(
        i.get(),
      ),
    )
    ..registerFactory<DefaultCurrencyCubit>(
      DefaultCurrencyCubit.new,
    )
    ..registerFactory<OtpCubit>(
      OtpCubit.new,
    )
    ..registerFactory<HomeCubit>(
      HomeCubit.new,
    );
}
