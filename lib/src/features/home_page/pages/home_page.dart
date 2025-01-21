import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/navigation/entities/auto_route_extension.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/features/home_page/cubit/home_cubit.dart';
import 'package:vaultiq/src/features/home_page/widgets/home_body.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _listener(BuildContext context, HomeState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(HomeState prev, HomeState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<HomeCubit>(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<HomeCubit>(context);
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            body: HomeBody(
              homeCubit: cubit,
            ),
          );
        },
      ),
    );
  }
}
