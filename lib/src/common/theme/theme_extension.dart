import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/theme/theme_provider.dart';
import 'package:vaultiq/src/common/theme/vaultiq_theme.dart';

extension ThemeExtension on BuildContext {
  VaultiqTheme get theme => ThemeProvider.of(this).theme;

  ThemeData get themeData => ThemeProvider.of(this).themeData;
}
