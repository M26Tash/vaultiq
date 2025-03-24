import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/shared_cubits/locale_cubit/app_locale_cubit.dart';
import 'package:vaultiq/src/common/shared_cubits/navigation_panel_cubit/navigation_panel_cubit.dart';
import 'package:vaultiq/src/common/shared_cubits/theme_cubit/theme_shared_cubit.dart';
import 'package:vaultiq/src/common/utils/convertors/theme_type_convertor.dart';
import 'package:vaultiq/src/common/utils/enum/theme_type.dart';

part 'more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  final NavigationPanelCubit _navigationPanelCubit;
  final AppLocaleCubit _appLocaleCubit;
  final ThemeSharedCubit _themeSharedCubit;
  MoreCubit(
    this._navigationPanelCubit,
    this._appLocaleCubit,
    this._themeSharedCubit,
  ) : super(
          MoreState(
            isLocalAuthEnabled: false,
            isDarkThemeEnabled: ThemeTypeConvertor.toBool(
              _themeSharedCubit.state.themeType,
            ),
            // isDarkThemeEnabled: false,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<ThemeSharedState>? _themeStateSubscription;

  @override
  Future<void> close() {
    _themeStateSubscription?.cancel();
    _themeStateSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _themeStateSubscription?.cancel();
    _themeStateSubscription = _themeSharedCubit.stream.listen(
      (event) => _onNewThemeState(
        event.themeType,
      ),
    );

    _onNewThemeState(_themeSharedCubit.state.themeType);
  }

  void _onNewThemeState(ThemeType themeType) {
    emit(
      state.copyWith(
        isDarkThemeEnabled: ThemeTypeConvertor.toBool(themeType),
      ),
    );
    log('${state.isDarkThemeEnabled}');
  }

  void updateLocale(String locale) {
    _appLocaleCubit.setLocale(
      Locale(
        locale,
      ),
    );
  }

  void toggleLocalAuthSwitcher({required bool value}) {
    emit(
      state.copyWith(
        isLocalAuthEnabled: value,
      ),
    );
  }

  void toggleThemeSwitcher({required bool value}) {
    final newTheme = ThemeTypeConvertor.fromBool(value: value);
    _themeSharedCubit.setThemeType(newTheme);

    emit(
      state.copyWith(
        isDarkThemeEnabled: value,
      ),
    );
  }

  void navigateToMyAccountPage() {
    return _navigationPanelCubit.navigateToMyAccountPage();
  }
}
