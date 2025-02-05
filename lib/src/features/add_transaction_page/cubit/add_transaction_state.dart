part of 'add_transaction_cubit.dart';

class AddTransactionState extends Equatable {
  final CustomizedRoute route;
  final String currency;
  @override
  List<Object?> get props => [
        route,
        currency,
      ];

  const AddTransactionState({
    required this.route,
    required this.currency,
  });

  AddTransactionState copyWith({
    CustomizedRoute? route,
    String? currency,
  }) {
    return AddTransactionState(
      route: route ?? this.route,
      currency: currency ?? this.currency,
    );
  }
}
