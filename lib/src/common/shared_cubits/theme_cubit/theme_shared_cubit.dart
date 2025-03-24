import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/utils/convertors/theme_type_convertor.dart';

import 'package:vaultiq/src/common/utils/enum/theme_type.dart';
import 'package:vaultiq/src/core/domain/interactors/local_data_interactor.dart';

part 'theme_shared_state.dart';

class ThemeSharedCubit extends Cubit<ThemeSharedState> {
  final LocalDataInteractor _localDataInteractor;
  ThemeSharedCubit(
    this._localDataInteractor,
  ) : super(
          const ThemeSharedState(
            themeType: ThemeType.dark,
          ),
        );

  ThemeType get themeType => state.themeType;

  Future<void> readThemeType() async {
    final themeType = await _localDataInteractor.readThemeType();
    final convertedThemeType = ThemeTypeConvertor.fromText(themeType);
    emit(
      state.copyWith(
        themeType: convertedThemeType,
      ),
    );
  }

  Future<void> setThemeType(ThemeType themeType) async {
    await _localDataInteractor.writeThemeType(themeType: themeType);

    emit(
      state.copyWith(
        themeType: themeType,
      ),
    );
  }
}
