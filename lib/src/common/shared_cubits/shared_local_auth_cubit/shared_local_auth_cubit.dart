import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/utils/convertors/local_auth_status_convertor.dart';
import 'package:vaultiq/src/common/utils/enum/local_auth_status.dart';
import 'package:vaultiq/src/core/domain/interactors/local_data_interactor.dart';

part 'shared_local_auth_state.dart';

class SharedLocalAuthCubit extends Cubit<SharedLocalAuthState> {
  final LocalDataInteractor _localDataInteractor;
  SharedLocalAuthCubit(
    this._localDataInteractor,
  ) : super(
          const SharedLocalAuthState(
            localAuthStatus: LocalAuthStatus.disable,
          ),
        );

  LocalAuthStatus get localAuthStatus => state.localAuthStatus;

  Future<void> readLocalAuthStatusType() async {
    final localAuth = await _localDataInteractor.readLocalAuth();
    final convertedThemeType = LocalAuthStatusConvertor.fromText(localAuth);
    emit(
      state.copyWith(
        localAuthStatus: convertedThemeType,
      ),
    );
  }

  Future<void> setLocalAuthStatusType(LocalAuthStatus localAuth) async {
    await _localDataInteractor.writeLocalAuth(
      authStatus: localAuth,
    );

    emit(
      state.copyWith(
        localAuthStatus: localAuth,
      ),
    );
  }
}
