import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/navigation/entities/auto_route_extension.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:vaultiq/src/features/about_app_page/cubit/about_app_cubit.dart';
import 'package:vaultiq/src/features/about_app_page/widgets/about_app_body.dart';

@RoutePage()
class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  void _listener(BuildContext context, AboutAppState state) {
    if (state.route.type == TypeRoute.pop) {
      context.maybePop();
    } else if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(AboutAppState prev, AboutAppState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AboutAppCubit>(
      child: BlocConsumer<AboutAppCubit, AboutAppState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<AboutAppCubit>(context);
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: CustomAppBar(
              svgAssetPath: AppAssets.arrowLeftIcon,
              onLeadingTap: cubit.navigateBack,
              title: 'About App',
            ),
            body: const AboutAppBody(),
          );
        },
      ),
    );
  }
}
