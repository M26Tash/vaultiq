part of 'add_transaction_cubit.dart';

class AddTransactionState extends Equatable {
  final CustomizedRoute route;
  final String currency;
  final List<WalletModel?>? wallets;
  final WalletModel? selectedNormalWallet;
  final WalletModel? selectedToWallet;

  @override
  List<Object?> get props => [
        route,
        currency,
        wallets,
        selectedNormalWallet,
        selectedToWallet,
      ];

  const AddTransactionState({
    required this.route,
    required this.currency,
    required this.wallets,
    required this.selectedNormalWallet,
    required this.selectedToWallet,
  });

  AddTransactionState copyWith({
    CustomizedRoute? route,
    String? currency,
    List<WalletModel?>? wallets,
    WalletModel? selectedNormalWallet,
    WalletModel? selectedFromWallet,
    WalletModel? selectedToWallet,
  }) {
    return AddTransactionState(
      route: route ?? this.route,
      currency: currency ?? this.currency,
      wallets: wallets ?? this.wallets,
      selectedNormalWallet: selectedNormalWallet ?? this.selectedNormalWallet,
      selectedToWallet: selectedToWallet ?? this.selectedToWallet,
    );
  }
}
