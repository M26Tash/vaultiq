import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/common/navigation/route.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit()
      : super(
          const OtpState(
            route: CustomizedRoute(null, null),
          ),
        );

  void navigateToDefaultCurrencyPage() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(
          TypeRoute.navigateTo,
          DefaultCurrencyRoute(),
        ),
      ),
    );

    Future.microtask(_resetRoute);
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
