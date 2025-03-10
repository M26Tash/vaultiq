import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final String symbol;
  final bool allowNegative;

  CurrencyInputFormatter({
    this.symbol = '',
    this.allowNegative = false,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final selectionIndex = newValue.selection.end;

    var isNegative = false;
    var valueText = newValue.text;

    if (allowNegative && valueText.startsWith('-')) {
      isNegative = true;
      valueText = valueText.substring(1);
    }

    if (symbol.isNotEmpty && valueText.startsWith(symbol)) {
      valueText = valueText.substring(symbol.length);
    }

    final addingDecimal =
        !oldValue.text.contains('.') && newValue.text.contains('.');

    valueText = valueText.replaceAll(RegExp(r'[^\d.]'), '');

    final parts = valueText.split('.');
    if (parts.length > 2) {
      valueText = '${parts.first}.${parts.sublist(1).join()}';
    }

    final wholePartText = parts.isNotEmpty ? parts[0] : '';
    var decimalPartText = parts.length > 1 ? parts[1] : '';

    if (decimalPartText.length > 2) {
      decimalPartText = decimalPartText.substring(0, 2);
    }

    var formattedWholePart = '';
    if (wholePartText.isEmpty) {
      formattedWholePart = '0';
    } else {
      final value = int.parse(wholePartText);
      formattedWholePart = value.toString().replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match match) => '${match[1]},',
          );
    }

    var result = formattedWholePart;
    if (decimalPartText.isNotEmpty || addingDecimal) {
      result += '.$decimalPartText';
    }

    if (isNegative) {
      result = '-$result';
    }

    if (symbol.isNotEmpty) {
      result = '$symbol$result';
    }

    var newSelectionIndex = result.length;
    if (oldValue.text.isNotEmpty) {
      if (selectionIndex <= oldValue.text.length) {
        var oldSeparatorCount = 0;
        for (var i = 0; i < selectionIndex; i++) {
          if (i < oldValue.text.length && oldValue.text[i] == ',') {
            oldSeparatorCount++;
          }
        }

        var newSeparatorCount = 0;
        for (var i = 0; i < result.length; i++) {
          if (result[i] == ',') {
            newSeparatorCount++;
            if (newSeparatorCount > oldSeparatorCount) {
              break;
            }
          }
        }

        newSelectionIndex =
            selectionIndex + (newSeparatorCount - oldSeparatorCount);

        if (addingDecimal && !oldValue.text.contains('.')) {
          newSelectionIndex++;
        }

        newSelectionIndex = newSelectionIndex.clamp(0, result.length);
      }
    }

    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: newSelectionIndex),
    );
  }
}
