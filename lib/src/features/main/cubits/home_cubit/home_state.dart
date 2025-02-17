part of 'home_cubit.dart';

class HomeState extends Equatable {
  final ExchangeModel rates;

  @override
  List<Object?> get props => [
        rates,
      ];

  const HomeState({
    required this.rates,
  });

  HomeState copyWith({
    ExchangeModel? rates,
  }) {
    return HomeState(
      rates: rates ?? this.rates,
    );
  }
}
