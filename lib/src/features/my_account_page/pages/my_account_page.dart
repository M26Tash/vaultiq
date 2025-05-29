import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/navigation/entities/auto_route_extension.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:vaultiq/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:vaultiq/src/features/my_account_page/cubit/my_account_cubit.dart';
import 'package:vaultiq/src/features/my_account_page/widgets/my_account_body.dart';

@RoutePage()
class MyAccountPage extends StatelessWidget {
  final ProfileModel profileModel;
  const MyAccountPage({
    required this.profileModel,
    super.key,
  });

  void _listener(BuildContext context, MyAccountState state) {
    if (state.route.type == TypeRoute.pop) {
      context.maybePop();
    } else if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(MyAccountState prev, MyAccountState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<MyAccountCubit>(
      child: BlocConsumer<MyAccountCubit, MyAccountState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<MyAccountCubit>(context);
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: CustomAppBar(
              svgAssetPath: AppAssets.arrowLeftIcon,
              onLeadingTap: cubit.navigateBack,
              title: 'My Account',
            ),
            body: MyAccountBody(
              myAccountCubit: cubit,
              image: state.image,
              profileModel: profileModel,
            ),
          );
        },
      ),
    );
  }
}
