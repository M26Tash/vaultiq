import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/common/navigation/entities/auto_route_extension.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/common/navigation/route.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/features/local_auth_page/cubit/local_auth_cubit.dart';
import 'package:vaultiq/src/features/local_auth_page/widgets/local_auth_body.dart';

@RoutePage()
class LocalAuthPage extends StatefulWidget {
  const LocalAuthPage({super.key});

  @override
  State<LocalAuthPage> createState() => _LocalAuthPageState();
}

class _LocalAuthPageState extends State<LocalAuthPage> {
  final cubit = i.get<LocalAuthCubit>();

  @override
  void initState() {
    super.initState();

    cubit.getAvailableBiometrics();
    Future.delayed(const Duration(seconds: 1), () {
      cubit.showLocalAuth(localizedReason: 'Testing Something');
    });
    // ..showLocalAuth(localizedReason: 'Testing Something');
  }

  void _listener(BuildContext context, LocalAuthState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }

    if (state.didAuthenticate == true) {
      context.navigateToRoute(
        const CustomizedRoute(
          TypeRoute.navigateTo,
          MainRoute(),
        ),
      );
    }
  }

  bool _listenWhen(LocalAuthState prev, LocalAuthState current) {
    return prev.route.type == null && current.route.type != null ||
        prev.didAuthenticate == false && current.didAuthenticate == true;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<LocalAuthCubit>(
      child: BlocConsumer<LocalAuthCubit, LocalAuthState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            body: const LocalAuthBody(),
          );
        },
      ),
    );
  }
}
