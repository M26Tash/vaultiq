import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/common/navigation/route.dart';
import 'package:vaultiq/src/common/utils/enum/transaction_type.dart';
import 'package:vaultiq/src/core/domain/entities/profile_model/profile_model.dart';

part 'navigation_state.dart';

class NavigationPanelCubit extends Cubit<NavigationPanelState> {
  NavigationPanelCubit()
      : super(
          const NavigationPanelState(
            navigationIndex: 0,
            route: CustomizedRoute(null, null),
          ),
        );

  void updateNavigationIndex(int navigationIndex, {bool? isMainPage}) {
    if (state.navigationIndex == navigationIndex) return;

    emit(
      state.copyWith(
        navigationIndex: navigationIndex,
      ),
    );
  }

  void navigateToAddTransactionPage(TransactionType transactionType) {
    emit(
      state.copyWith(
        route: CustomizedRoute(
          TypeRoute.navigateTo,
          AddTransactionRoute(transactionType: transactionType),
        ),
      ),
    );

    Future.microtask(_resetRoute);
  }

  void navigateToMyAccountPage({
    required ProfileModel profileModel,
  }) {
    emit(
      state.copyWith(
        route: CustomizedRoute(
          TypeRoute.navigateTo,
          MyAccountRoute(profileModel: profileModel),
        ),
      ),
    );

    _resetRoute();
  }

  void navigateToHelpCenterPage() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(
          TypeRoute.navigateTo,
          HelpCenterRoute(),
        ),
      ),
    );

    _resetRoute();
  }

  void navigateAboutAppPage() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(
          TypeRoute.navigateTo,
          AboutAppRoute(),
        ),
      ),
    );

    _resetRoute();
  }

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(null, null),
      ),
    );
  }
}
