part of 'shared_local_auth_cubit.dart';

final class SharedLocalAuthState extends Equatable {
  final LocalAuthStatus localAuthStatus;

  @override
  List<Object?> get props => [
        localAuthStatus,
      ];

  const SharedLocalAuthState({
    required this.localAuthStatus,
  });

  SharedLocalAuthState copyWith({
    LocalAuthStatus? localAuthStatus,
  }) {
    return SharedLocalAuthState(
      localAuthStatus: localAuthStatus ?? this.localAuthStatus,
    );
  }
}
