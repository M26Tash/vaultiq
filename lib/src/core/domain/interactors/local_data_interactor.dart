import 'package:flutter/cupertino.dart';
import 'package:vaultiq/src/common/utils/enum/local_auth_status.dart';
import 'package:vaultiq/src/common/utils/enum/theme_type.dart';
import 'package:vaultiq/src/core/domain/interfaces/i_local_data_repository.dart';

final class LocalDataInteractor {
  final ILocalDataRepository _localDataRepository;

  LocalDataInteractor(this._localDataRepository);

  Future<void> writeThemeType({
    required ThemeType themeType,
  }) {
    return _localDataRepository.writeThemeType(
      themeType: themeType,
    );
  }

  Future<String> readThemeType() async {
    return _localDataRepository.readThemeType();
  }

  Future<void> writeLocale({
    required Locale locale,
  }) {
    return _localDataRepository.writeLocale(
      locale: locale,
    );
  }

  Future<String> readLocale() async {
    return _localDataRepository.readLocale();
  }

  Future<void> writeLocalAuth({
    required LocalAuthStatus authStatus,
  }) {
    return _localDataRepository.writeLocalAuth(
      authStatus: authStatus,
    );
  }

  Future<String> readLocalAuth() async {
    return _localDataRepository.readLocalAuth();
  }
}
