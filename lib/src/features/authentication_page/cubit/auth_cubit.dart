import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/common/navigation/route.dart';
import 'package:vaultiq/src/common/utils/enum/auth_step.dart';
import 'package:vaultiq/src/core/domain/interactors/auth_interactor.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthInteractor _authInteractor;
  AuthCubit(
    this._authInteractor,
  ) : super(
          const AuthState(
            route: CustomizedRoute(null, null),
            currentAuthStep: AuthStep.signIn,
            email: 'user.test@gmail.com',
            signInExceptionMessage: null,
            registerInExceptionMessage: null,
            currentSession: null,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<String?>? _signInExceptionMessageSubscription;
  StreamSubscription<String?>? _registerExceptionMessageSubscription;
  StreamSubscription<Session?>? _sessionSubscription;

  @override
  Future<void> close() {
    _signInExceptionMessageSubscription?.cancel();
    _signInExceptionMessageSubscription = null;

    _registerExceptionMessageSubscription?.cancel();
    _registerExceptionMessageSubscription = null;

    _sessionSubscription?.cancel();
    _sessionSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _signInExceptionMessageSubscription?.cancel();
    _signInExceptionMessageSubscription =
        _authInteractor.signInExceptionMessageStream.listen(
      _onNewSignInExceptionMessage,
    );

    _registerExceptionMessageSubscription?.cancel();
    _registerExceptionMessageSubscription =
        _authInteractor.registerExceptionMessageStream.listen(
      _onNewRegisterExceptionMessage,
    );

    _sessionSubscription?.cancel();
    _sessionSubscription = _authInteractor.sessionStream.listen(
      _onNewSession,
    );
  }

  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) {
    return _authInteractor.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> registerWithPassword({
    required String email,
    required String password,
  }) {
    return _authInteractor.registerWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() {
    return _authInteractor.signOut();
  }

  void _onNewSignInExceptionMessage(String? message) {
    emit(
      state.copyWith(
        signInExceptionMessage: message,
      ),
    );
  }

  void _onNewRegisterExceptionMessage(String? message) {
    emit(
      state.copyWith(
        registerInExceptionMessage: message,
      ),
    );
  }

  void _onNewSession(Session? session) {
    emit(
      state.copyWith(
        currentSession: session,
      ),
    );
  }

  void swapAuthStep(AuthStep authStep) {
    emit(
      state.copyWith(
        currentAuthStep: authStep,
      ),
    );
  }

  void navigateToForgotPasswordPage() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(
          TypeRoute.navigateTo,
          ForgotPasswordRoute(),
        ),
      ),
    );

    Future.microtask(_resetRoute);
  }

  void navigateToOtpPage() {
    emit(
      state.copyWith(
        route: CustomizedRoute(
          TypeRoute.navigateTo,
          OtpRoute(email: state.email),
        ),
      ),
    );

    Future.microtask(_resetRoute);
  }

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(null, null),
      ),
    );
  }
}
