import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaultiq/src/core/domain/entities/faq_model/faq_model.dart';
import 'package:vaultiq/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';

abstract interface class IDataSource {
  Stream<List<TransactionModel>?> get transactionStream;

  Stream<List<WalletModel>?> get walletStream;

  Stream<List<FAQModel?>?> get faqStream;

  Stream<ProfileModel?> get profileStream;

  Future<void> getTransactions();

  Future<void> getWallets();

  Future<void> addTransaction(TransactionModel transaction);

  Future<void> updateProfile(ProfileModel profile);

  Future<void> getProfile();

  Future<void> fetchFaq(Locale currentLocale);

  Future<void> uploadAvatar(XFile? avatar);
}
