part of 'home_cubit.dart';

class HomeState extends Equatable {
  final ExchangeModel rates;
  final List<WalletModel?>? wallets;
  final double totalBalance;

  @override
  List<Object?> get props => [
        rates,
        wallets,
        totalBalance,
      ];

  const HomeState({
    required this.rates,
    required this.wallets,
    required this.totalBalance,
  });

  HomeState copyWith({
    ExchangeModel? rates,
    List<TransactionModel?>? transactions,
    List<WalletModel?>? wallets,
    double? totalBalance,
  }) {
    return HomeState(
      rates: rates ?? this.rates,
      wallets: wallets ?? this.wallets,
      totalBalance: totalBalance ?? this.totalBalance,
    );
  }
}
