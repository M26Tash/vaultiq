import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vaultiq/src/common/utils/enum/theme_type.dart';

part 'theme_shared_state.dart';

class ThemeSharedCubit extends Cubit<ThemeSharedState> {
  ThemeSharedCubit()
      : super(
          const ThemeSharedState(
            themeType: ThemeType.dark,
          ),
        );
}
