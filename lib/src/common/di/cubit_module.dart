import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/common/shared_cubits/navigation_panel_cubit/navigation_panel_cubit.dart';
import 'package:vaultiq/src/common/shared_cubits/theme_cubit/theme_shared_cubit.dart';
import 'package:vaultiq/src/features/app/cubit/app_cubit.dart';
import 'package:vaultiq/src/features/authentication_page/cubit/auth_cubit.dart';
import 'package:vaultiq/src/features/default_currency_page/cubit/default_currency_cubit.dart';
import 'package:vaultiq/src/features/forgot_password_page/cubit/forgot_password_cubit.dart';
import 'package:vaultiq/src/features/add_transaction_page/cubit/add_transaction_cubit.dart';
import 'package:vaultiq/src/features/main/cubits/wallet_cubit/wallet_cubit.dart';
import 'package:vaultiq/src/features/otp_page/cubit/otp_cubit.dart';

void initSharedCubits() {
  i
    ..registerSingleton<ThemeSharedCubit>(
      ThemeSharedCubit(),
    )
    ..registerSingleton<NavigationPanelCubit>(
      NavigationPanelCubit(),
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
    ..registerFactory<WalletCubit>(
      WalletCubit.new,
    )
    ..registerFactory<AddTransactionCubit>(
      AddTransactionCubit.new,
    );
}
