import 'package:intl/intl.dart';

extension StringExtension on String {
  String toValidThruFormat() {
    final parsedDate = DateFormat('yyyy-mm-dd').parse(this);
    final formattedDate = DateFormat('mm/yy').format(parsedDate);

    return formattedDate;
  }

  String toTransactionFormat() {
    final parsedDate = DateTime.parse(this);
    final formattedDate = DateFormat('dd - MM yyyy, hh:mm').format(parsedDate);

    return formattedDate;
  }

  String getRawValue() {
    return replaceAll(RegExp(r'[^\d.-]'), '');
  }

  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  DateTime createdAtParsed() {
    final createdAt = DateTime.parse(this);

    return createdAt;
  }
}
