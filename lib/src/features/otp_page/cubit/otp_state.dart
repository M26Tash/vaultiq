part of 'otp_cubit.dart';

class OtpState extends Equatable {
  final CustomizedRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const OtpState({
    required this.route,
  });

  OtpState copyWith({
    CustomizedRoute? route,
  }) {
    return OtpState(
      route: route ?? this.route,
    );
  }
}
