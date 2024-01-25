import 'package:intl/intl.dart';

class CustomNumberFormat {
  static String commaFormat(double value) {
    var pattern = NumberFormat("###,###.0#", "en_US");
    return pattern.format(value);
  }
}
