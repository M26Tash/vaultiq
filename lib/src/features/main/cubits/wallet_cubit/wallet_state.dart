part of 'wallet_cubit.dart';

class WalletState extends Equatable {
  final WalletType currentTab;

  @override
  List<Object?> get props => [
        currentTab,

      ];

  const WalletState({
    required this.currentTab,
  });

  WalletState copyWith({
    WalletType? currentTab,
  }) {
    return WalletState(
      currentTab: currentTab ?? this.currentTab,
      
    );
  }
}
