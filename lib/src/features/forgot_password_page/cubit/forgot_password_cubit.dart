import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/core/domain/interactors/auth_interactor.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthInteractor _authInteractor;
  ForgotPasswordCubit(
    this._authInteractor,
  ) : super(
          const ForgotPasswordState(
            route: CustomizedRoute(null, null),
          ),
        );

  Future<void> resetPassword({required String email}) {
    return _authInteractor.resetPassword(
      email: email,
    );
  }

  void navigateBack() {
    emit(
      state.copyWith(
        route: const CustomizedRoute.pop(),
      ),
    );
  }
}
