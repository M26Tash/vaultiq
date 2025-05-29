import 'package:vaultiq/src/common/utils/enum/local_auth_status.dart';

abstract final class LocalAuthStatusConvertor {
  static LocalAuthStatus fromText(String localAuth) {
    return switch (localAuth) {
      'LocalAuthStatus.enable' => LocalAuthStatus.enable,
      'LocalAuthStatus.disable' => LocalAuthStatus.disable,
      _ => throw UnimplementedError('Undefined local auth')
    };
  }

  static LocalAuthStatus fromBool({required bool value}) {
    return switch (value) {
      false => LocalAuthStatus.disable,
      true => LocalAuthStatus.enable,
    };
  }

  static bool toBool(LocalAuthStatus localAuth) {
    return switch (localAuth) {
      LocalAuthStatus.enable => true,
      LocalAuthStatus.disable => false,
    };
  }
}
