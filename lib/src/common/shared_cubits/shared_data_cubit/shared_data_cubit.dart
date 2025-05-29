import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/utils/enum/transaction_type.dart';
import 'package:vaultiq/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';
import 'package:vaultiq/src/core/domain/interactors/data_interactor.dart';

part 'shared_data_state.dart';

class SharedDataCubit extends Cubit<SharedDataState> {
  final DataInteractor _dataInteractor;
  SharedDataCubit(
    this._dataInteractor,
  ) : super(
          const SharedDataState(
            profileModel: ProfileModel(),
            transactions: null,
            wallets: null,
            totalBalance: 0,
            incomeSpots: [],
            expenseSpots: [],
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<ProfileModel?>? _profileModelStreamSubscription;
  StreamSubscription<List<TransactionModel?>?>? _transactionsStreamSubscription;
  StreamSubscription<List<WalletModel?>?>? _walletsStreamSubscription;

  @override
  Future<void> close() {
    _profileModelStreamSubscription?.cancel();
    _profileModelStreamSubscription = null;

    _transactionsStreamSubscription?.cancel();
    _transactionsStreamSubscription = null;

    _walletsStreamSubscription?.cancel();
    _walletsStreamSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _profileModelStreamSubscription?.cancel();
    _profileModelStreamSubscription = _dataInteractor.profileStream.listen(
      _onNewProfileModelState,
    );

    _transactionsStreamSubscription?.cancel();
    _transactionsStreamSubscription = _dataInteractor.transactionStream.listen(
      _onNewTransactionsState,
    );

    _walletsStreamSubscription?.cancel();
    _walletsStreamSubscription = _dataInteractor.walletStream.listen(
      _onNewWalletsState,
    );
  }

  Future<void> getProfile() async {
    return _dataInteractor.getProfile();
  }

  Future<void> getTranscations() async {
    return _dataInteractor.getTransactions();
  }

  Future<void> getWallets() async {
    return _dataInteractor.getWallets();
  }

  void _onNewProfileModelState(ProfileModel? profileModel) {
    emit(
      state.copyWith(
        profileModel: profileModel,
      ),
    );
  }

  void _onNewTransactionsState(List<TransactionModel>? transactions) {
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

    final incomeSpots =
        List.generate(7, (i) => FlSpot(i.toDouble(), incomeTotals[i]));
    final expenseSpots =
        List.generate(7, (i) => FlSpot(i.toDouble(), expenseTotals[i]));

    emit(
      state.copyWith(
        transactions: transactions,
        incomeSpots: incomeSpots,
        expenseSpots: expenseSpots,
      ),
    );
  }

  void _onNewWalletsState(List<WalletModel>? wallets) {
    emit(
      state.copyWith(
        wallets: wallets,
      ),
    );

    double balance = 0;

    if (wallets!.isNotEmpty) {
      if (wallets.length == 1) {
        emit(
          state.copyWith(
            totalBalance: wallets.first.balance,
          ),
        );
      }

      if (wallets.length > 1) {
        for (final wallet in wallets) {
          balance += wallet.balance;
        }
        emit(
          state.copyWith(totalBalance: balance),
        );
      }
    }
  }
}
