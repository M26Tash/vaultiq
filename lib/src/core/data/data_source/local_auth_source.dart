import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:rxdart/subjects.dart';
import 'package:vaultiq/src/core/data/data_source/interfaces/i_local_auth_source.dart';
import 'package:vaultiq/src/core/domain/utils/core_logger.dart';

class LocalAuthSource implements ILocalAuthSource {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  final BehaviorSubject<bool?> _isLocalAuthSubject = BehaviorSubject();

  @override
  Stream<bool?> get isLocalAuthStream => _isLocalAuthSubject;

  @override
  Future<void> authenticateWithBiometrics({
    required String localizedReason,
  }) async {
    try {
      final isLocalAuth = await _localAuthentication.authenticate(
        localizedReason: localizedReason,
      );

      _isLocalAuthSubject.add(isLocalAuth);
    } on PlatformException catch (e) {
      CoreLogger.errorLog(
        'authenticateWithBiometrics',
        params: {
          'Error authenticating with biometrics:': e.message,
        },
      );
    }
  }

  @override
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _localAuthentication.getAvailableBiometrics();
    } on Exception catch (e) {
      CoreLogger.errorLog(
        'getAvailableBiometrics',
        params: {
          'Error getting available biometrics:': '$e',
        },
      );
      return [];
    }
  }
}
