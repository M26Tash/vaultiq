part of 'add_transaction_cubit.dart';

class AddTransactionState extends Equatable {
  final CustomizedRoute route;
  final String currency;
  final List<WalletModel?>? wallets;
  final WalletModel? selectedNormalWallet;
  final WalletModel? selectedToWallet;
  final DateTime? selectedDateTime;
  @override
  List<Object?> get props => [
        route,
        currency,
        wallets,
        selectedNormalWallet,
        selectedToWallet,
        selectedDateTime,
      ];

  const AddTransactionState({
    required this.route,
    required this.currency,
    required this.wallets,
    required this.selectedNormalWallet,
    required this.selectedToWallet,
    required this.selectedDateTime,
  });

  AddTransactionState copyWith({
    CustomizedRoute? route,
    String? currency,
    List<WalletModel?>? wallets,
    WalletModel? selectedNormalWallet,
    WalletModel? selectedFromWallet,
    WalletModel? selectedToWallet,
    DateTime? selectedDateTime,
  }) {
    return AddTransactionState(
      route: route ?? this.route,
      currency: currency ?? this.currency,
      wallets: wallets ?? this.wallets,
      selectedNormalWallet: selectedNormalWallet ?? this.selectedNormalWallet,
      selectedToWallet: selectedToWallet ?? this.selectedToWallet,
      selectedDateTime: selectedDateTime ?? this.selectedDateTime,
    );
  }
}
