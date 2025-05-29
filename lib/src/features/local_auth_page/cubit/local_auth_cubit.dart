import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/core/domain/interactors/local_auth_interactor.dart';

part 'local_auth_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> {
  final LocalAuthInteractor _localAuthInteractor;
  LocalAuthCubit(this._localAuthInteractor)
      : super(
          const LocalAuthState(
            route: CustomizedRoute(null, null),
            didAuthenticate: false,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<bool?>? _isLocaleAuthSubscription;

  @override
  Future<void> close() {
    _isLocaleAuthSubscription?.cancel();
    _isLocaleAuthSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _isLocaleAuthSubscription?.cancel();
    _isLocaleAuthSubscription = _localAuthInteractor.isLocalAuthStream.listen(
      _onNewLocaleAuthState,
    );
  }

  void _onNewLocaleAuthState(bool? didAuthenticate) {
    emit(
      state.copyWith(
        didAuthenticate: didAuthenticate,
      ),
    );
  }

  Future<void> getAvailableBiometrics() async {
    return _localAuthInteractor.getAvailableBiometrics();
  }

  Future<void> showLocalAuth({required String localizedReason}) async {
    return _localAuthInteractor.authenticateWithBiometrics(
      localizedReason: localizedReason,
    );
  }

  // void navigateToDefaultCurrencyPage() {
  //   emit(
  //     state.copyWith(
  //       route: const CustomizedRoute(
  //         TypeRoute.navigateTo,
  //         DefaultCurrencyRoute(),
  //       ),
  //     ),
  //   );

  //   Future.microtask(_resetRoute);
  // }

  void navigateBack() {
    emit(
      state.copyWith(
        route: const CustomizedRoute.pop(),
      ),
    );
  }

  // void _resetRoute() {
  //   emit(
  //     state.copyWith(
  //       route: const CustomizedRoute(null, null),
  //     ),
  //   );
  // }
}
