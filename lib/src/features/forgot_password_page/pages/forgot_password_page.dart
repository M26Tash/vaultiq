import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/navigation/entities/auto_route_extension.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:vaultiq/src/features/forgot_password_page/cubit/forgot_password_cubit.dart';
import 'package:vaultiq/src/features/forgot_password_page/widgets/forgot_password_body.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  void _listener(BuildContext context, ForgotPasswordState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(ForgotPasswordState prev, ForgotPasswordState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<ForgotPasswordCubit>(
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listener: _listener,
        listenWhen: _listenWhen,
        child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
          builder: (context, state) {
            final cubit = CubitScope.of<ForgotPasswordCubit>(context);
            return Scaffold(
              backgroundColor: context.theme.backgroundColor,
              appBar: CustomAppBar(
                svgAssetPath: AppAssets.arrowLeftIcon,
                onLeadingTap: cubit.navigateBack,
              ),
              body: SafeArea(
                child: ForgotPasswordBody(
                  forgotPasswordCubit: cubit,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
