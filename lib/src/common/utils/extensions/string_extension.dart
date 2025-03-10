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
}
