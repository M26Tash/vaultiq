part of 'shared_data_cubit.dart';

final class SharedDataState extends Equatable {
  final ProfileModel profileModel;
  final List<TransactionModel>? transactions;
  final List<WalletModel>? wallets;
  final double totalBalance;
  final List<FlSpot> incomeSpots;
  final List<FlSpot> expenseSpots;
  @override
  List<Object?> get props => [
        profileModel,
        transactions,
        wallets,
        totalBalance,
        incomeSpots,
        expenseSpots,
      ];

  const SharedDataState({
    required this.profileModel,
    required this.transactions,
    required this.wallets,
    required this.totalBalance,
    required this.incomeSpots,
    required this.expenseSpots,
  });

  SharedDataState copyWith({
    ProfileModel? profileModel,
    List<TransactionModel>? transactions,
    List<WalletModel>? wallets,
    double? totalBalance,
    List<FlSpot>? incomeSpots,
    List<FlSpot>? expenseSpots,
  }) {
    return SharedDataState(
      profileModel: profileModel ?? this.profileModel,
      transactions: transactions ?? this.transactions,
      wallets: wallets ?? this.wallets,
      totalBalance: totalBalance ?? this.totalBalance,
      incomeSpots: incomeSpots ?? this.incomeSpots,
      expenseSpots: expenseSpots ?? this.expenseSpots,
    );
  }
}
