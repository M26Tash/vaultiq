//
// ignore_for_file: unused_element

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';

part 'default_currency_state.dart';

class DefaultCurrencyCubit extends Cubit<DefaultCurrencyState> {
  DefaultCurrencyCubit()
      : super(
          const DefaultCurrencyState(
            route: CustomizedRoute(null, null),
          ),
        );

  // void navigateToForgotPasswordPage() {
  //   emit(
  //     state.copyWith(
  //       route: const CustomizedRoute(
  //         TypeRoute.navigateTo,
  //         ForgotPasswordRoute(),
  //       ),
  //     ),
  //   );

  //   Future.microtask(_resetRoute);
  // }

  void chooseDefaultCurrency(String currencyCode) {
    emit(
      state.copyWith(
        defaultCurrency: currencyCode,
      ),
    );
  }

  void navigateBack() {
    emit(
      state.copyWith(
        route: const CustomizedRoute.pop(),
      ),
    );
  }

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(null, null),
      ),
    );
  }
}
