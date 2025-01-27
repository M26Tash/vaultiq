//
// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:developer';

import 'package:rxdart/subjects.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:vaultiq/src/core/data/data_source/interfaces/i_auth_data_source.dart';
import 'package:vaultiq/src/core/domain/utils/core_logger.dart';

class AuthDataSource implements IAuthDataSource {
  final supabase = Supabase.instance.client;

  final BehaviorSubject<String?> _signInExceptionMessageSubject =
      BehaviorSubject();

  final BehaviorSubject<String?> _registerExceptionMessageSubject =
      BehaviorSubject();

  final BehaviorSubject<Session?> _sessionSubject = BehaviorSubject();

  AuthDataSource() {
    supabase.auth.onAuthStateChange.listen(
      (event) {
        log('${event.session}');
        _sessionSubject.add(event.session);
      },
    );
  }

  @override
  Stream<String?> get signInExceptionMessageStream =>
      _signInExceptionMessageSubject;

  @override
  Stream<String?> get registerExceptionMessageStream =>
      _registerExceptionMessageSubject;

  @override
  Stream<Session?> get sessionStream => _sessionSubject;

  @override
  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
      CoreLogger.errorLog(
        'signInWithPassword()',
        params: {
          'Caught error': e.message,
        },
      );

      _signInExceptionMessageSubject.add(e.message);
    }
  }

  @override
  Future<void> registerWithPassword({
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
      CoreLogger.errorLog(
        'registerWithPassword()',
        params: {
          'Caught error': e.message,
        },
      );

      _registerExceptionMessageSubject.add(e.message);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } on AuthException catch (e) {
      CoreLogger.errorLog(
        'signOut()',
        params: {
          'Caught error': e.message,
        },
      );
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      supabase.auth.onAuthStateChange;

      await supabase.auth.resetPasswordForEmail(email);
    } catch (e) {
      CoreLogger.errorLog(
        'forgotPassword()',
        params: {
          'Caught error': e,
        },
      );
    }
  }
}
