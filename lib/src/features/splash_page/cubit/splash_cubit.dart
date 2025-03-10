// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/common/navigation/route.dart';
import 'package:vaultiq/src/core/domain/entities/exchange_model/exchange_model.dart';
import 'package:vaultiq/src/core/domain/interactors/exchange_rate_interactor.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final ExchangeRateInteractor _exchangeRateInteractor;
  AnimationController? _animationController;
  Timer? _navigationTimer;

  SplashCubit(this._exchangeRateInteractor)
      : super(
          const SplashState(
            route: CustomizedRoute(null, null),
            rates: ExchangeModel(),
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<ExchangeModel?>? _exchangeRateSubscription;

  @override
  Future<void> close() {
    _exchangeRateSubscription?.cancel();
    _exchangeRateSubscription = null;

    _animationController?.dispose();
    _navigationTimer?.cancel();

    return super.close();
  }

  void _subscribeAll() {
    _exchangeRateSubscription?.cancel();
    _exchangeRateSubscription =
        _exchangeRateInteractor.exchangeRateStream.listen(
      _onNewExchangeRate,
    );
  }

  Future<void> getExchangeRate() async {
    return _exchangeRateInteractor.getExchangeRate();
  }

  void initAnimation(AnimationController controller, Size screenSize) {
    _animationController = controller;

    controller
      ..addListener(() {
        final animatedPosition = 0.0 + (controller.value * 1.1);

        final progress = controller.value;
        final backgroundColor = progress > 0.8
            ? Color.lerp(
                  const Color(0xFFFF6600),
                  const Color(0xFF1D1F21),
                  (progress - 0.8) * 5,
                ) ??
                const Color(0xFFFF6600)
            : const Color(0xFFFF6600);

        final buttonY = screenSize.height * (1.0 - animatedPosition);
        final updatedTrace = List<Offset>.from(state.tracePoints);

        if (progress > 0 && progress < 1.0) {
          updatedTrace.add(Offset(screenSize.width / 2, buttonY + 40));
        }

        emit(
          state.copyWith(
            buttonPosition: animatedPosition,
            backgroundColor: backgroundColor,
            tracePoints: updatedTrace,
          ),
        );
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed &&
            state.rates.result == 'success') {
          emit(
            state.copyWith(
              route: const CustomizedRoute(
                TypeRoute.navigateTo,
                AuthRoute(),
              ),
            ),
          );
        }
        // if (status == AnimationStatus.completed) {
        //   emit(state.copyWith(animationCompleted: true));

        //   if (state.rates.result == 'success') {

        //   }
        // }
      });
  }

  void clearExchangeRate() {
    return _exchangeRateInteractor.clearExchangeRate();
  }

  void _onNewExchangeRate(ExchangeModel? rates) {
    emit(
      state.copyWith(
        rates: rates,
      ),
    );
  }
}
