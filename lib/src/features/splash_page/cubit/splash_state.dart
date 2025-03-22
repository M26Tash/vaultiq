part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final CustomizedRoute route;
  final ExchangeModel rates;
  final double buttonPosition;
  final List<Offset> tracePoints;
  final Color backgroundColor;
  final bool animationCompleted;

  @override
  List<Object?> get props => [
        route,
        rates,
        buttonPosition,
        tracePoints,
        backgroundColor,
        animationCompleted,
      ];

  const SplashState({
    required this.route,
    required this.rates,
    this.buttonPosition = 0.1,
    this.tracePoints = const [],
    this.backgroundColor = Colors.orange,
    this.animationCompleted = false,
  });

  SplashState copyWith({
    CustomizedRoute? route,
    ExchangeModel? rates,
    double? buttonPosition,
    List<Offset>? tracePoints,
    Color? backgroundColor,
    bool? animationCompleted,
  }) {
    return SplashState(
      route: route ?? this.route,
      rates: rates ?? this.rates,
      buttonPosition: buttonPosition ?? this.buttonPosition,
      tracePoints: tracePoints ?? this.tracePoints,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      animationCompleted: animationCompleted ?? this.animationCompleted,
    );
  }
}
