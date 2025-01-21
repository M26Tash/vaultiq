import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/navigation/entities/auto_route_extension.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:vaultiq/src/features/otp_page/cubit/otp_cubit.dart';
import 'package:vaultiq/src/features/otp_page/widgets/otp_body.dart';

@RoutePage()
class OtpPage extends StatelessWidget {
  final String email;
  const OtpPage({
    required this.email,
    super.key,
  });

  void _listener(BuildContext context, OtpState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(OtpState prev, OtpState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<OtpCubit>(
      child: BlocListener<OtpCubit, OtpState>(
        listener: _listener,
        listenWhen: _listenWhen,
        child: BlocBuilder<OtpCubit, OtpState>(
          builder: (context, state) {
            final cubit = CubitScope.of<OtpCubit>(context);
            return Scaffold(
              backgroundColor: context.theme.backgroundColor,
              appBar: CustomAppBar(
                svgAssetPath: AppAssets.arrowLeftIcon,
                onLeadingTap: cubit.navigateBack,
              ),
              body: OtpBody(
                otpCubit: cubit,
                email: email,
              ),
            );
          },
        ),
      ),
    );
  }
}
