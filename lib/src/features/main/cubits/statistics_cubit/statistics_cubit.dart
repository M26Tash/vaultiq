import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/shared_cubits/shared_data_cubit/shared_data_cubit.dart';
import 'package:vaultiq/src/common/utils/enum/transaction_type.dart';
import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';

part 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  final SharedDataCubit _sharedDataCubit;
  StatisticsCubit(
    this._sharedDataCubit,
  ) : super(
          const StatisticsState(
            transactions: null,
            incomeSpots: [],
            expenseSpots: [],
          ),
        ) {
    _onNewTransactionsState();
  }

  List<TransactionModel>? get _transactions =>
      _sharedDataCubit.state.transactions;

  void filterTransactions({
    TransactionType? type,
    DateTime? startDate,
    DateTime? endDate,
    double? minAmount,
    double? maxAmount,
  }) {
    final originalList = _sharedDataCubit.state.transactions;

    if (originalList == null) return;

    final filtered = originalList.where((transaction) {
      final matchesType = type == null || transaction.transactionType == type;

      final transactionDate = DateTime.parse(transaction.createdAt);

      final matchesDate =
          (startDate == null || transactionDate.isAfter(startDate)) &&
              (endDate == null || transactionDate.isBefore(endDate));

      final matchesMinAmount =
          minAmount == null || transaction.defaultAmount >= minAmount;
      final matchesMaxAmount =
          maxAmount == null || transaction.defaultAmount <= maxAmount;

      return matchesType && matchesDate && matchesMinAmount && matchesMaxAmount;
    }).toList();

    emit(
      state.copyWith(transactions: filtered),
    );

    _generateFlSpots(filtered);
  }

  void _onNewTransactionsState() {
    emit(
      state.copyWith(
        transactions: _transactions,
      ),
    );

    _generateFlSpots(_transactions);
  }

  void _generateFlSpots(List<TransactionModel>? transactions) {
    final now = DateTime.now();
    final startOfToday = DateTime(now.year, now.month, now.day);
    final incomeTotals = List<double>.filled(7, 0);
    final expenseTotals = List<double>.filled(7, 0);

    for (final txn in transactions!) {
      final txnDate = DateTime.parse(txn.createdAt);
      final difference = startOfToday
          .difference(
            DateTime(txnDate.year, txnDate.month, txnDate.day),
          )
          .inDays;

      if (difference >= 0 && difference < 7) {
        final x = 6 - difference;

        if (txn.transactionType == TransactionType.income) {
          incomeTotals[x] += txn.defaultAmount;
        } else if (txn.transactionType == TransactionType.expense) {
          expenseTotals[x] += txn.defaultAmount;
        }
      }
    }

    final incomeSpots = List.generate(
      7,
      (i) => FlSpot(
        i.toDouble(),
        incomeTotals[i],
      ),
    );
    final expenseSpots = List.generate(
      7,
      (i) => FlSpot(
        i.toDouble(),
        expenseTotals[i],
      ),
    );

    emit(
      state.copyWith(
        incomeSpots: incomeSpots,
        expenseSpots: expenseSpots,
      ),
    );
  }
}
