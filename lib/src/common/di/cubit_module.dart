import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/common/shared_cubits/locale_cubit/app_locale_cubit.dart';
import 'package:vaultiq/src/common/shared_cubits/navigation_panel_cubit/navigation_panel_cubit.dart';
import 'package:vaultiq/src/common/shared_cubits/theme_cubit/theme_shared_cubit.dart';
import 'package:vaultiq/src/features/add_transaction_page/cubit/add_transaction_cubit.dart';
import 'package:vaultiq/src/features/app/cubit/app_cubit.dart';
import 'package:vaultiq/src/features/authentication_page/cubit/auth_cubit.dart';
import 'package:vaultiq/src/features/default_currency_page/cubit/default_currency_cubit.dart';
import 'package:vaultiq/src/features/forgot_password_page/cubit/forgot_password_cubit.dart';
import 'package:vaultiq/src/features/local_auth_page/cubit/local_auth_cubit.dart';
import 'package:vaultiq/src/features/main/cubits/home_cubit/home_cubit.dart';
import 'package:vaultiq/src/features/main/cubits/more_cubit/more_cubit.dart';
import 'package:vaultiq/src/features/main/cubits/wallet_cubit/wallet_cubit.dart';
import 'package:vaultiq/src/features/my_account_page/cubit/my_account_cubit.dart';
import 'package:vaultiq/src/features/otp_page/cubit/otp_cubit.dart';
import 'package:vaultiq/src/features/splash_page/cubit/splash_cubit.dart';

void initSharedCubits() {
  i
    ..registerSingleton<AppLocaleCubit>(
      AppLocaleCubit(
        i.get(),
      ),
    )
    ..registerSingleton<ThemeSharedCubit>(
      ThemeSharedCubit(
        i.get(),
      ),
    )
    ..registerFactory<NavigationPanelCubit>(
      NavigationPanelCubit.new,
    );
}

void initCubits() {
  i
    ..registerFactory<AppCubit>(
      () => AppCubit(
        i.get(),
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
      () => WalletCubit(
        i.get(),
      ),
    )
    ..registerFactory<AddTransactionCubit>(
      () => AddTransactionCubit(
        i.get(),
      ),
    )
    ..registerFactory<SplashCubit>(
      () => SplashCubit(
        i.get(),
      ),
    )
    ..registerFactory<HomeCubit>(
      () => HomeCubit(
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<MyAccountCubit>(MyAccountCubit.new)
    ..registerFactory<MoreCubit>(
      () => MoreCubit(
        i.get(),
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<LocalAuthCubit>(
      () => LocalAuthCubit(
        i.get(),
      ),
    );
}
