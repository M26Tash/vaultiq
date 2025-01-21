import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/navigation/entities/auto_route_extension.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/extensions/context_extension.dart';
import 'package:vaultiq/src/features/authentication_page/cubit/auth_cubit.dart';
import 'package:vaultiq/src/features/authentication_page/widgets/auth_body.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  void _listener(BuildContext context, AuthState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }

    if (state.signInExceptionMessage != null) {
      context.showErrorSnackBar(
        state.signInExceptionMessage!,
      );
    }

    if (state.registerInExceptionMessage != null) {
      context.showErrorSnackBar(
        state.registerInExceptionMessage!,
      );
    }
  }

  bool _listenWhen(AuthState prev, AuthState current) {
    return prev.route.type == null && current.route.type != null ||
        prev.signInExceptionMessage != current.signInExceptionMessage ||
        prev.registerInExceptionMessage != current.registerInExceptionMessage;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AuthCubit>(
      child: BlocListener<AuthCubit, AuthState>(
        listener: _listener,
        listenWhen: _listenWhen,
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final cubit = CubitScope.of<AuthCubit>(context);

            return Scaffold(
              backgroundColor: context.theme.backgroundColor,
              body: SafeArea(
                child: AuthBody(
                  authCubit: cubit,
                  currentAuthStep: state.currentAuthStep,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
