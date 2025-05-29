// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/common/navigation/entities/auto_route_extension.dart';
import 'package:vaultiq/src/common/shared_cubits/locale_cubit/app_locale_cubit.dart';
import 'package:vaultiq/src/common/shared_cubits/shared_local_auth_cubit/shared_local_auth_cubit.dart';
import 'package:vaultiq/src/common/shared_cubits/theme_cubit/theme_shared_cubit.dart';
import 'package:vaultiq/src/features/splash_page/cubit/splash_cubit.dart';
import 'package:vaultiq/src/features/splash_page/widgets/splash_body.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  final splashCubit = i.get<SplashCubit>();
  late AnimationController _animationController;

  final AppLocaleCubit _appLocaleCubit = i.get<AppLocaleCubit>();
  final ThemeSharedCubit _themeSharedCubit = i.get<ThemeSharedCubit>();
  final SharedLocalAuthCubit _sharedLocalAuthCubit =
      i.get<SharedLocalAuthCubit>();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    splashCubit.getExchangeRate();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      splashCubit.initAnimation(
        _animationController,
        MediaQuery.of(context).size,
      );
      _animationController.forward();
    });

    _appLocaleCubit.readLocale();
    _themeSharedCubit.readThemeType();
    _sharedLocalAuthCubit.readLocalAuthStatusType();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _listener(BuildContext context, SplashState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(SplashState prev, SplashState current) {
    return prev.route.type == null && current.route.type != null ||
        prev.rates.result == null && current.rates.result != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<SplashCubit>(
      child: BlocConsumer<SplashCubit, SplashState>(
        bloc: splashCubit,
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<SplashCubit>(context);
          return Scaffold(
            backgroundColor: state.backgroundColor,
            body: SplashBody(
              cubit: cubit,
              backgroundColor: state.backgroundColor,
              tracePoints: state.tracePoints,
              buttonPosition: state.buttonPosition,
              animationCompleted: state.animationCompleted,
              rates: state.rates,
            ),
          );
        },
      ),
    );
  }
}
