part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final CustomizedRoute route;
  final ExchangeModel rates;
  
  @override
  List<Object?> get props => [
        route,
        rates,
      ];

  const SplashState({
    required this.route,
    required this.rates,
  });

  SplashState copyWith({
    CustomizedRoute? route,
    ExchangeModel? rates,
  }) {
    return SplashState(
      route: route ?? this.route,
      rates: rates ?? this.rates,
    );
  }
}