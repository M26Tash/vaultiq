import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/shared_cubits/locale_cubit/app_locale_cubit.dart';
import 'package:vaultiq/src/common/shared_cubits/navigation_panel_cubit/navigation_panel_cubit.dart';
import 'package:vaultiq/src/common/shared_cubits/shared_local_auth_cubit/shared_local_auth_cubit.dart';
import 'package:vaultiq/src/common/shared_cubits/theme_cubit/theme_shared_cubit.dart';
import 'package:vaultiq/src/common/utils/convertors/local_auth_status_convertor.dart';
import 'package:vaultiq/src/common/utils/convertors/theme_type_convertor.dart';
import 'package:vaultiq/src/common/utils/enum/local_auth_status.dart';
import 'package:vaultiq/src/common/utils/enum/theme_type.dart';
import 'package:vaultiq/src/core/domain/entities/profile_model/profile_model.dart';

part 'more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  final NavigationPanelCubit _navigationPanelCubit;
  final AppLocaleCubit _appLocaleCubit;
  final ThemeSharedCubit _themeSharedCubit;
  final SharedLocalAuthCubit _sharedLocalAuthCubit;
  MoreCubit(
    this._navigationPanelCubit,
    this._appLocaleCubit,
    this._themeSharedCubit,
    this._sharedLocalAuthCubit,
  ) : super(
          MoreState(
            isLocalAuthEnabled: LocalAuthStatusConvertor.toBool(
              _sharedLocalAuthCubit.state.localAuthStatus,
            ),
            isDarkThemeEnabled: ThemeTypeConvertor.toBool(
              _themeSharedCubit.state.themeType,
            ),
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<ThemeSharedState>? _themeStateSubscription;
  StreamSubscription<SharedLocalAuthState>? _sharedLocalAuthStateSubscription;

  @override
  Future<void> close() {
    _themeStateSubscription?.cancel();
    _themeStateSubscription = null;

    _sharedLocalAuthStateSubscription?.cancel();
    _sharedLocalAuthStateSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _themeStateSubscription?.cancel();
    _themeStateSubscription = _themeSharedCubit.stream.listen(
      (event) => _onNewThemeState(
        event.themeType,
      ),
    );

    _sharedLocalAuthStateSubscription?.cancel();
    _sharedLocalAuthStateSubscription = _sharedLocalAuthCubit.stream.listen(
      (event) => _onNewSharedLocalAuthState(
        event.localAuthStatus,
      ),
    );

    _onNewThemeState(_themeSharedCubit.state.themeType);
    _onNewSharedLocalAuthState(
      _sharedLocalAuthCubit.state.localAuthStatus,
    );
  }

  void _onNewThemeState(ThemeType themeType) {
    emit(
      state.copyWith(
        isDarkThemeEnabled: ThemeTypeConvertor.toBool(themeType),
      ),
    );
  }

  void _onNewSharedLocalAuthState(
    LocalAuthStatus localAuth,
  ) {
    emit(
      state.copyWith(
        isLocalAuthEnabled: LocalAuthStatusConvertor.toBool(localAuth),
      ),
    );
  }

  void updateLocale(String locale) {
    _appLocaleCubit.setLocale(
      Locale(
        locale,
      ),
    );
  }

  void toggleLocalAuthSwitcher({required bool value}) {
    final newLocalAuthStatus = LocalAuthStatusConvertor.fromBool(value: value);
    _sharedLocalAuthCubit.setLocalAuthStatusType(newLocalAuthStatus);

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

  void navigateToMyAccountPage({
    required ProfileModel profileModel,
  }) {
    return _navigationPanelCubit.navigateToMyAccountPage(
      profileModel: profileModel,
    );
  }

  void navigateToHelpCenterPage() {
    return _navigationPanelCubit.navigateToHelpCenterPage();
  }

  void navigateToAboutAppPage() {
    return _navigationPanelCubit.navigateAboutAppPage();
  }
}
