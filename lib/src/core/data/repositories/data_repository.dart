import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaultiq/src/core/data/data_source/interfaces/i_data_source.dart';
import 'package:vaultiq/src/core/domain/entities/faq_model/faq_model.dart';
import 'package:vaultiq/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';
import 'package:vaultiq/src/core/domain/interfaces/i_data_repository.dart';

final class DataRepository implements IDataRepository {
  final IDataSource _dataSource;

  DataRepository(this._dataSource);

  @override
  Stream<List<TransactionModel>?> get transactionStream =>
      _dataSource.transactionStream;

  @override
  Stream<List<WalletModel>?> get walletStream => _dataSource.walletStream;

  @override
  Stream<List<FAQModel?>?> get faqStream => _dataSource.faqStream;

  @override
  Stream<ProfileModel?> get profileStream => _dataSource.profileStream;

  @override
  Future<void> getTransactions() async {
    return _dataSource.getTransactions();
  }

  @override
  Future<void> getWallets() async {
    return _dataSource.getWallets();
  }

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    return _dataSource.addTransaction(transaction);
  }

  @override
  Future<void> updateProfile(ProfileModel profile) async {
    return _dataSource.updateProfile(profile);
  }

  @override
  Future<void> getProfile() async {
    return _dataSource.getProfile();
  }

  @override
  Future<void> fetchFaq(Locale locale) async {
    return _dataSource.fetchFaq(locale);
  }

  @override
  Future<void> uploadAvatar(XFile? avatar) async {
    return _dataSource.uploadAvatar(avatar);
  }
}
