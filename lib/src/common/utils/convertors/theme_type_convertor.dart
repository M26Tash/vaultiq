import 'package:vaultiq/src/common/utils/enum/theme_type.dart';

abstract final class ThemeTypeConvertor {
  static ThemeType fromText(String themeType) {
    return switch (themeType) {
      'ThemeType.light' => ThemeType.light,
      'ThemeType.dark' => ThemeType.dark,
      _ => throw UnimplementedError('Undefined theme type')
    };
  }

  static ThemeType fromBool({required bool value}) {
    return switch (value) {
      false => ThemeType.light,
      true => ThemeType.dark,
    };
  }

  static bool toBool(ThemeType themeType) {
    return switch (themeType) {
      ThemeType.light => false,
      ThemeType.dark => true,
    };
  }
}
