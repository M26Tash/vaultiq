part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final CustomizedRoute route;
  final AuthStep currentAuthStep;
  final String email;
  final String? signInExceptionMessage;
  final String? registerInExceptionMessage;
  final Session? currentSession;
  @override
  List<Object?> get props => [
        route,
        currentAuthStep,
        email,
        signInExceptionMessage,
        registerInExceptionMessage,
        currentSession,
      ];

  const AuthState({
    required this.route,
    required this.currentAuthStep,
    required this.email,
    required this.signInExceptionMessage,
    required this.registerInExceptionMessage,
    required this.currentSession,
  });

  AuthState copyWith({
    CustomizedRoute? route,
    AuthStep? currentAuthStep,
    String? email,
    String? signInExceptionMessage,
    String? registerInExceptionMessage,
    Session? currentSession,
  }) {
    return AuthState(
      route: route ?? this.route,
      currentAuthStep: currentAuthStep ?? this.currentAuthStep,
      email: email ?? this.email,
      signInExceptionMessage:
          signInExceptionMessage ?? this.signInExceptionMessage,
      registerInExceptionMessage:
          registerInExceptionMessage ?? this.registerInExceptionMessage,
      currentSession: currentSession ?? this.currentSession,
    );
  }
}
