part of 'default_currency_cubit.dart';

class DefaultCurrencyState extends Equatable {
  final CustomizedRoute route;
  final String? defaultCurrency;
  @override
  List<Object?> get props => [
        route,
        defaultCurrency,
      ];

  const DefaultCurrencyState({
    required this.route,
    this.defaultCurrency,
  });

  DefaultCurrencyState copyWith({
    CustomizedRoute? route,
    String? defaultCurrency,
  }) {
    return DefaultCurrencyState(
      route: route ?? this.route,
      defaultCurrency: defaultCurrency ?? this.defaultCurrency,
    );
  }
}
