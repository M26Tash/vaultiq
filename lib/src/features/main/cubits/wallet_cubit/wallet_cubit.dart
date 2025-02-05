import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/utils/enum/wallet_tab.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit()
      : super(
          const WalletState(
            currentTab: WalletTab.purses,
          ),
        );

   void swapWalletTab(WalletTab walletTab) {
    emit(
      state.copyWith(
        currentTab: walletTab,
      ),
    );
  } 
}
