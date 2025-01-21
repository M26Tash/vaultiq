part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  final CustomizedRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const ForgotPasswordState({
    required this.route,
  });

  ForgotPasswordState copyWith({
    CustomizedRoute? route,
  }) {
    return ForgotPasswordState(
      route: route ?? this.route,
    );
  }
}
