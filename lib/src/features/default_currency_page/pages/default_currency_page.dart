import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/localization/localizations_ext.dart';
import 'package:vaultiq/src/common/navigation/entities/auto_route_extension.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:vaultiq/src/common/widgets/custom_button/custom_button.dart';
import 'package:vaultiq/src/features/default_currency_page/cubit/default_currency_cubit.dart';
import 'package:vaultiq/src/features/default_currency_page/widgets/default_currency_body.dart';

@RoutePage()
class DefaultCurrencyPage extends StatelessWidget {
  const DefaultCurrencyPage({super.key});

  void _listener(BuildContext context, DefaultCurrencyState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(DefaultCurrencyState prev, DefaultCurrencyState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<DefaultCurrencyCubit>(
      child: BlocListener<DefaultCurrencyCubit, DefaultCurrencyState>(
        listener: _listener,
        listenWhen: _listenWhen,
        child: BlocBuilder<DefaultCurrencyCubit, DefaultCurrencyState>(
          builder: (context, state) {
            final cubit = CubitScope.of<DefaultCurrencyCubit>(context);
            return Scaffold(
              backgroundColor: context.theme.backgroundColor,
              appBar: CustomAppBar(
                svgAssetPath: AppAssets.arrowLeftIcon,
                onLeadingTap: cubit.navigateBack,
              ),
              body: DefaultCurrencyBody(
                defaultCurrencyCubit: cubit,
                defaultCurrency: state.defaultCurrency,
              ),
              bottomNavigationBar: BottomAppBar(
                color: context.theme.backgroundColor,
                child: CustomButton(
                  buttonText: context.locale.continues,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
