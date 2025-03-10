import 'package:vaultiq/src/common/utils/enum/transaction_type.dart';

abstract final class TransactionTypeConvertor {
  static TransactionType convertToEnum(String value) => switch (value) {
        'income' => TransactionType.income,
        'expense' => TransactionType.expense,
        'transfer' => TransactionType.transfer,
        _ => throw UnimplementedError('Invalid ENUM'),
      };

  static String convertToAppBarTitle(TransactionType value) => switch (value) {
        TransactionType.income => 'Add Income',
        TransactionType.expense => 'Add Expense',
        TransactionType.transfer => 'Add Transfer',
      };

  static String convertToString(TransactionType value) => switch (value) {
        TransactionType.income => 'income',
        TransactionType.expense => 'expense',
        TransactionType.transfer => 'transfer',
      };
}
