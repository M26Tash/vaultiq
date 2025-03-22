part of 'wallet_cubit.dart';

class WalletState extends Equatable {
  final WalletType currentTab;
  final List<WalletModel?>? wallets;

  @override
  List<Object?> get props => [
        currentTab,
        wallets,
      ];

  const WalletState({
    required this.currentTab,
    required this.wallets,
  });

  WalletState copyWith({
    WalletType? currentTab,
    List<WalletModel?>? wallets,
  }) {
    return WalletState(
      currentTab: currentTab ?? this.currentTab,
      wallets: wallets ?? this.wallets,
    );
  }
}
