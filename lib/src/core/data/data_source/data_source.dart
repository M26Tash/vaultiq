import 'dart:developer';

import 'package:rxdart/subjects.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vaultiq/src/core/data/data_source/interfaces/i_data_source.dart';
import 'package:vaultiq/src/core/data/mappers/transaction_mapper/transaction_mapper.dart';
import 'package:vaultiq/src/core/data/mappers/wallet_mapper/wallet_mapper.dart';
import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';
import 'package:vaultiq/src/core/domain/utils/core_logger.dart';

class DataSource implements IDataSource {
  final supabase = Supabase.instance.client;

  final BehaviorSubject<List<TransactionModel?>?> _transactionSubject =
      BehaviorSubject();

  final BehaviorSubject<List<WalletModel?>?> _walletSubject = BehaviorSubject();

  List<TransactionModel>? _cachedTransactions;
  List<WalletModel>? _cachedWallets;

  @override
  Stream<List<TransactionModel?>?> get transactionStream => _transactionSubject;

  @override
  Stream<List<WalletModel?>?> get walletStream => _walletSubject;

  @override
  Future<void> getTransactions() async {
    if (_cachedTransactions != null) {
      _transactionSubject.add(_cachedTransactions);
      CoreLogger.warningLog('Serving cached transactions');
    }

    try {
      final response = await supabase.from('transactions').select().order(
            'created_at',
            ascending: false,
          );

      if (response.isNotEmpty) {
        final transactions =
            response.map((item) => TransactionMapper().fromJson(item)).toList();

        _cachedTransactions = transactions;

        _transactionSubject.add(transactions);
      }

      if (response.isEmpty) {
        _transactionSubject.add([null]);
      }

      supabase
          .channel('transactions_channel')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'transactions',
            callback: (payload) {
              getTransactions();
            },
          )
          .subscribe();
    } on PostgrestException catch (e) {
      CoreLogger.errorLog(
        'getTransactions()',
        params: {
          'Caught error': e.message,
        },
      );
    }
  }

  @override
  Future<void> getWallets() async {
    if (_cachedWallets != null) {
      _walletSubject.add(_cachedWallets);
      CoreLogger.warningLog('Serving cached wallets');
    }

    try {
      final response = await supabase.from('wallets').select();

      if (response.isNotEmpty) {
        final wallets =
            response.map((wallet) => WalletMapper().fromJson(wallet)).toList();

        _cachedWallets = wallets;

        _walletSubject.add(wallets);
      }

      if (response.isEmpty) {
        _walletSubject.add([null]);
      }

      supabase
          .channel('wallets_channel')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'wallets',
            callback: (payload) {
              getWallets();
            },
          )
          .subscribe();
    } on PostgrestException catch (e) {
      CoreLogger.errorLog(
        'getWallets()',
        params: {
          'Caught error': e.message,
        },
      );
    }
  }

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    try {
      final newTransaction = transaction.copyWith(
        userId: '7f7cac36-98d3-4b08-86c8-28af7fdedde8',
      );

      final jsonTransaction = TransactionMapper().toJson(newTransaction);
      log('$jsonTransaction');

      await supabase.from('transactions').insert(
            jsonTransaction,
          );
    } on PostgrestException catch (e) {
      CoreLogger.errorLog(
        'addTransaction()',
        params: {
          'Caught error': e.message,
        },
      );
    }
  }
}
