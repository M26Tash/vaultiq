
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/utils/enum/wallet_type.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  
  WalletCubit(
  
  ) : super(
          const WalletState(
            currentTab: WalletType.wallet,
          ),
        );

  void swapWalletTab(WalletType walletTab) {
    emit(
      state.copyWith(
        currentTab: walletTab,
      ),
    );
  }
}
