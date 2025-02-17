import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/common/navigation/entities/auto_route_extension.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/common/navigation/route.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/features/splash_page/cubit/splash_cubit.dart';
import 'package:vaultiq/src/features/splash_page/widgets/splash_body.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashCubit = i.get<SplashCubit>();

  @override
  void initState() {
    super.initState();

    splashCubit.getExchangeRate();
  }

  void _listener(BuildContext context, SplashState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }

    if (state.rates.result == 'success') {
      context.navigateToRoute(
        const CustomizedRoute(
          TypeRoute.navigateTo,
          AuthRoute(),
        ),
      );
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
            backgroundColor: context.theme.backgroundColor,
            body: SplashBody(
              result: state.rates.result,
              onTryAgainTap: () {
                cubit
                  ..clearExchangeRate()
                  ..getExchangeRate();
              },
            ),
          );
        },
      ),
    );
  }
}
