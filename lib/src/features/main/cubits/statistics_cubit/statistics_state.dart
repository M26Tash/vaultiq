part of 'statistics_cubit.dart';

class StatisticsState extends Equatable {
  final List<TransactionModel>? transactions;
  final List<FlSpot> incomeSpots;
  final List<FlSpot> expenseSpots;
  @override
  List<Object?> get props => [
        transactions,
        incomeSpots,
        expenseSpots,
      ];

  const StatisticsState({
    required this.transactions,
    required this.incomeSpots,
    required this.expenseSpots,
  });

  StatisticsState copyWith({
    List<TransactionModel>? transactions,
    List<FlSpot>? incomeSpots,
    List<FlSpot>? expenseSpots,
  }) {
    return StatisticsState(
      transactions: transactions ?? this.transactions,
      incomeSpots: incomeSpots ?? this.incomeSpots,
      expenseSpots: expenseSpots ?? this.expenseSpots,
    );
  }
}
