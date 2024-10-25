import 'package:intl/intl.dart';

class DateTimeFormat {
  static String formatDateTime(DateTime? dateTime) =>
      DateFormat('dd/MM/yyyy').format(dateTime ?? DateTime.now()).toString();
}
