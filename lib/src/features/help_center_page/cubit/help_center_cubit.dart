import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/core/domain/entities/faq_model/faq_model.dart';
import 'package:vaultiq/src/core/domain/interactors/data_interactor.dart';

part 'help_center_state.dart';

class HelpCenterCubit extends Cubit<HelpCenterState> {
  final DataInteractor _dataInteractor;
  HelpCenterCubit(
    this._dataInteractor,
  ) : super(
          const HelpCenterState(
            route: CustomizedRoute(null, null),
            faq: [],
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<FAQModel?>?>? _faqSubscription;

  @override
  Future<void> close() {
    _faqSubscription?.cancel();
    _faqSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _faqSubscription?.cancel();
    _faqSubscription = _dataInteractor.faqStream.listen(
      _onNewFaq,
    );
  }

  Future<void> fetchFaq(Locale locale) async {
    return _dataInteractor.fetchFaq(locale);
  }

  void _onNewFaq(List<FAQModel?>? faq) {
    emit(
      state.copyWith(
        faq: faq,
      ),
    );

    log('FAAQ: ${state.faq}');
  }

  void navigateBack() {
    emit(
      state.copyWith(
        route: const CustomizedRoute.pop(),
      ),
    );
  }
}
