import 'dart:ui';

import 'package:vaultiq/src/common/utils/enum/local_auth_status.dart';
import 'package:vaultiq/src/common/utils/enum/theme_type.dart';
import 'package:vaultiq/src/core/data/data_source/interfaces/i_local_data_source.dart';
import 'package:vaultiq/src/core/domain/interfaces/i_local_data_repository.dart';

final class LocalDataRepository implements ILocalDataRepository {
  final ILocalDataSource _localDataSource;

  LocalDataRepository(this._localDataSource);

  @override
  Future<String> readLocalAuth() async {
    return _localDataSource.readLocalAuth();
  }

  @override
  Future<String> readLocale() async {
    return _localDataSource.readLocale();
  }

  @override
  Future<String> readThemeType() async {
    return _localDataSource.readThemeType();
  }

  @override
  Future<void> writeLocalAuth({required LocalAuthStatus authStatus}) {
    return _localDataSource.writeLocalAuth(
      authStatus: authStatus,
    );
  }

  @override
  Future<void> writeLocale({required Locale locale}) async {
    return _localDataSource.writeLocale(
      locale: locale,
    );
  }

  @override
  Future<void> writeThemeType({required ThemeType themeType}) async {
    return _localDataSource.writeThemeType(
      themeType: themeType,
    );
  }
}
