import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/shared_cubits/locale_cubit/app_locale_cubit.dart';
import 'package:vaultiq/src/common/shared_cubits/theme_cubit/theme_shared_cubit.dart';
import 'package:vaultiq/src/common/utils/enum/theme_type.dart';

part 'app_state.dart';

const _defaultLocale = Locale('en');

class AppCubit extends Cubit<AppState> {
  final ThemeSharedCubit _themeCubit;
  final AppLocaleCubit _appLocaleCubit;
  AppCubit(
    this._themeCubit,
    this._appLocaleCubit,
  ) : super(
          AppState(
            themeType: _themeCubit.state.themeType,
            locale: _defaultLocale,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<ThemeSharedState>? _themeStateSubscription;
  StreamSubscription<AppLocaleState>? _appLocaleStateSubscription;

  @override
  Future<void> close() {
    _themeStateSubscription?.cancel();
    _themeStateSubscription = null;

    _appLocaleStateSubscription?.cancel();
    _appLocaleStateSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _themeStateSubscription?.cancel();
    _themeStateSubscription = _themeCubit.stream.listen(
      (event) => _onNewThemeState(
        event.themeType,
      ),
    );

    _appLocaleStateSubscription?.cancel();
    _appLocaleStateSubscription = _appLocaleCubit.stream.listen(
      (event) => _onNewAppLocaleState(
        event.locale,
      ),
    );
  }

  void _onNewThemeState(ThemeType themeType) {
    emit(
      state.copyWith(
        themeType: themeType,
      ),
    );
  }

  void _onNewAppLocaleState(Locale? locale) {
    emit(
      state.copyWith(
        locale: locale,
      ),
    );
  }

  // void _onAppStarted() {
  //   _changeTheme(_themeCubit.state.themeType);
  //   _themeCubit.stream.listen((state) {
  //     _changeTheme(state.themeType);
  //   });
  // }

  // void _changeTheme(ThemeType themeType) {
  //   emit(
  //     state.copyWith(
  //       themeType: themeType,
  //     ),
  //   );
  // }
}
