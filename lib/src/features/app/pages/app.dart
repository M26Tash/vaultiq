import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/theme/app_theme.dart';
import 'package:vaultiq/src/common/theme/theme_provider.dart';
import 'package:vaultiq/src/common/theme/vaultiq_theme.dart';
import 'package:vaultiq/src/common/utils/enum/theme_type.dart';
import 'package:vaultiq/src/features/app/cubit/app_cubit.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  VaultiqTheme _vaultiqTheme(AppState state) {
    return switch (state.themeType) {
      ThemeType.light => lightTheme,
      ThemeType.dark => darkTheme,
    };
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AppCubit>(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, appState) {
          final theme = _vaultiqTheme(appState);
          return ThemeProvider(
            theme: theme,
            themeData: generateThemeData(theme),
            child: const MaterialApp(
              home: Placeholder(),
            ),
          );
        },
      ),
    );
  }
}
