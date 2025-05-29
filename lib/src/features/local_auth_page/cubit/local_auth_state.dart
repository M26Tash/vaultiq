part of 'local_auth_cubit.dart';

class LocalAuthState extends Equatable {
  final CustomizedRoute route;
  final bool didAuthenticate;
  @override
  List<Object?> get props => [
        route,
        didAuthenticate,
      ];

  const LocalAuthState({
    required this.route,
    required this.didAuthenticate,
  });

  LocalAuthState copyWith({
    CustomizedRoute? route,
    bool? didAuthenticate,
  }) {
    return LocalAuthState(
      route: route ?? this.route,
      didAuthenticate: didAuthenticate ?? this.didAuthenticate,
    );
  }
}
