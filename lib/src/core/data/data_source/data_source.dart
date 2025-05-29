import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/subjects.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vaultiq/src/core/data/data_source/interfaces/i_data_source.dart';
import 'package:vaultiq/src/core/data/mappers/faq_mapper/faq_mapper.dart';
import 'package:vaultiq/src/core/data/mappers/profile_mapper/profile_mapper.dart';
import 'package:vaultiq/src/core/data/mappers/transaction_mapper/transaction_mapper.dart';
import 'package:vaultiq/src/core/data/mappers/wallet_mapper/wallet_mapper.dart';
import 'package:vaultiq/src/core/domain/entities/faq_model/faq_model.dart';
import 'package:vaultiq/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:vaultiq/src/core/domain/entities/transaction_model/transaction_model.dart';
import 'package:vaultiq/src/core/domain/entities/wallet_model/wallet_model.dart';
import 'package:vaultiq/src/core/domain/utils/core_logger.dart';

class DataSource implements IDataSource {
  final supabase = Supabase.instance.client;

  final BehaviorSubject<List<TransactionModel>?> _transactionSubject =
      BehaviorSubject();

  final BehaviorSubject<List<WalletModel>?> _walletSubject = BehaviorSubject();

  final BehaviorSubject<List<FAQModel?>?> _faqSubject = BehaviorSubject();

  final BehaviorSubject<ProfileModel?> _profileSubject = BehaviorSubject();

  List<TransactionModel>? _cachedTransactions;
  List<WalletModel>? _cachedWallets;
  List<FAQModel>? _cachedFaq;
  ProfileModel? _cachedProfile;

  String get userid => supabase.auth.currentUser!.id;

  @override
  Stream<List<TransactionModel>?> get transactionStream => _transactionSubject;

  @override
  Stream<List<WalletModel>?> get walletStream => _walletSubject;

  @override
  Stream<List<FAQModel?>?> get faqStream => _faqSubject;

  @override
  Stream<ProfileModel?> get profileStream => _profileSubject;

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
        _transactionSubject.add([]);
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
        _walletSubject.add([]);
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
        userId: userid,
      );

      final jsonTransaction = TransactionMapper().toJson(newTransaction);

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

  @override
  Future<void> updateProfile(ProfileModel profile) async {
    try {
      final updatedFields = <String, dynamic>{};

      if (profile.userName != null) {
        updatedFields['username'] = profile.userName;
      }
      if (profile.fullName != null) {
        updatedFields['full_name'] = profile.fullName;
      }
      if (profile.avatarUrl != null) {
        updatedFields['avatar_url'] = profile.avatarUrl;
      }
      if (profile.email != null) {
        updatedFields['email'] = profile.email;
      }
      if (profile.updatedAt != null) {
        updatedFields['updated_at'] = profile.updatedAt!.toIso8601String();
      }

      if (profile.dateOfBirth != null) {
        updatedFields['date_of_birth'] = profile.dateOfBirth!.toIso8601String();
      }

      await supabase.from('profiles').update(updatedFields).eq('id', userid);
    } on PostgrestException catch (e) {
      CoreLogger.errorLog(
        'updateProfile()',
        params: {
          'Caught error': e.message,
        },
      );
    }
  }

  @override
  Future<void> getProfile() async {
    if (_cachedProfile != null) {
      _profileSubject.add(_cachedProfile);
      CoreLogger.warningLog('Serving cached profile');
    }

    try {
      final response = await supabase.from('profiles').select();

      if (response.isNotEmpty) {
        final profile =
            response.map((item) => ProfileMapper().fromJson(item)).toList();

        _cachedProfile = profile.first;

        _profileSubject.add(profile.first);
      }

      supabase
          .channel('profiles_channel')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'profiles',
            callback: (payload) {
              getProfile();
            },
          )
          .subscribe();
    } on PostgrestException catch (e) {
      CoreLogger.errorLog(
        'getProfile()',
        params: {
          'Caught error': e.message,
        },
      );
    }
  }

  @override
  Future<void> fetchFaq(Locale locale) async {
    if (_cachedFaq != null) {
      _faqSubject.add(_cachedFaq);
      CoreLogger.warningLog('Serving cached FAQ');
    }

    try {
      final response = await supabase
          .from('faq')
          .select()
          .order('order_number', ascending: true);
      final faqList = <FAQModel>[];
      if (response.isNotEmpty) {
        final faq = response
            .map(
              (qa) => FAQMapper().fromJson(qa),
            )
            .toList();

        for (final faqs in faq) {
          if (faqs.languageCode == locale.languageCode) {
            faqList.add(faqs);
          }
        }
        _cachedFaq = faqList;

        _faqSubject.add(faqList);
      }
    } on PostgrestException catch (e) {
      CoreLogger.errorLog(
        'fetchFaq()',
        params: {
          'Caught error': e.message,
        },
      );
    }
  }

  @override
  Future<void> uploadAvatar(XFile? avatar) async {
    const yearInSeconds = 31536000;
    try {
      if (avatar != null) {
        final file = File(avatar.path);

        await supabase.storage.from('avatars').upload(
              userid,
              file,
              fileOptions: const FileOptions(upsert: true),
            );

        final signedUrl =
            await supabase.storage.from('avatars').createSignedUrl(
                  userid,
                  yearInSeconds,
                );
        updateProfile(
          ProfileModel(
            avatarUrl: signedUrl,
          ),
        );
      }
    } on StorageException catch (e) {
      CoreLogger.errorLog(
        'uploadAvatar()',
        params: {
          'Caught error': e.message,
        },
      );
    }
  }
}
