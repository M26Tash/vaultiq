import 'package:flutter/cupertino.dart';
import 'package:vaultiq/src/common/utils/enum/local_auth_status.dart';
import 'package:vaultiq/src/common/utils/enum/theme_type.dart';

abstract interface class ILocalDataRepository {
  Future<void> writeThemeType({required ThemeType themeType});

  Future<String> readThemeType();

  Future<void> writeLocale({required Locale locale});

  Future<String> readLocale();

  Future<void> writeLocalAuth({required LocalAuthStatus authStatus});

  Future<String> readLocalAuth();
}
