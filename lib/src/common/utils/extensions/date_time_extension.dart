import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toValidThru() {
    final formattedDate = DateFormat('mm/yy').format(this);

    return formattedDate;
  }
}
