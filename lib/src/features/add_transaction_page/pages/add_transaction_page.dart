import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/cubit_scope/cubit_scope.dart';
import 'package:vaultiq/src/common/navigation/entities/auto_route_extension.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/common/theme/theme_extension.dart';
import 'package:vaultiq/src/common/utils/convertors/transaction_type_convertor.dart';
import 'package:vaultiq/src/common/utils/enum/transaction_type.dart';
import 'package:vaultiq/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:vaultiq/src/features/add_transaction_page/cubit/add_transaction_cubit.dart';
import 'package:vaultiq/src/features/add_transaction_page/widgets/add_transaction_body.dart';

@RoutePage()
class AddTransactionPage extends StatelessWidget {
  final TransactionType transactionType;
  const AddTransactionPage({
    required this.transactionType,
    super.key,
  });

  void _listener(BuildContext context, AddTransactionState state) {
    if (state.route.type == TypeRoute.pop) {
      Navigator.of(context).pop();
    } else if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(AddTransactionState prev, AddTransactionState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AddTransactionCubit>(
      child: BlocConsumer<AddTransactionCubit, AddTransactionState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<AddTransactionCubit>(context);

          if (state.wallets == null) {
            return Center(
              child: CircularProgressIndicator(
                color: context.theme.primaryColor,
              ),
            );
          }

          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: CustomAppBar(
              svgAssetPath: AppAssets.arrowLeftIcon,
              title: TransactionTypeConvertor.convertToAppBarTitle(
                transactionType,
              ),
              onLeadingTap: cubit.navigateBack,
            ),
            body: AddTransactionBody(
              wallets: state.wallets!,
              transactionType: transactionType,
              selectedNormalWallet: state.selectedNormalWallet,
              selectedToWallet: state.selectedToWallet,
              currency: state.currency,
              cubit: cubit,
            ),
          );
        },
      ),
    );
  }
}
