part of 'wallet_cubit.dart';

class WalletState extends Equatable {
  final WalletTab currentTab;

  @override
  List<Object?> get props => [
        currentTab,
      ];

  const WalletState({
    required this.currentTab,
  });

  WalletState copyWith({
    WalletTab? currentTab,
  }) {
    return WalletState(
      currentTab: currentTab ?? this.currentTab,
    );
  }
}
