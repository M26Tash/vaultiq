import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaultiq/src/core/domain/entities/faq_model/faq_model.dart';
import 'package:vaultiq/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';
import 'package:vaultiq/src/core/domain/interfaces/i_data_repository.dart';

final class DataInteractor {
  final IDataRepository _dataRepository;

  DataInteractor(this._dataRepository);

  Stream<List<TransactionModel>?> get transactionStream =>
      _dataRepository.transactionStream;

  Stream<List<WalletModel>?> get walletStream => _dataRepository.walletStream;

  Stream<List<FAQModel?>?> get faqStream => _dataRepository.faqStream;

  Stream<ProfileModel?> get profileStream => _dataRepository.profileStream;

  Future<void> getTransactions() async {
    return _dataRepository.getTransactions();
  }

  Future<void> getWallets() async {
    return _dataRepository.getWallets();
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    return _dataRepository.addTransaction(transaction);
  }

  Future<void> updateProfile(ProfileModel profile) async {
    return _dataRepository.updateProfile(profile);
  }

  Future<void> getProfile() async {
    return _dataRepository.getProfile();
  }

  Future<void> fetchFaq(Locale locale) async {
    return _dataRepository.fetchFaq(locale);
  }

  Future<void> uploadAvatar(XFile? avatar) async {
    return _dataRepository.uploadAvatar(avatar);
  }
}
