import 'package:intl/intl.dart';

class CustomNumberFormat {
  static String commaFormat(double? value) {
    var pattern = NumberFormat("###,###.0#", "en_US");
    return value == 0 ? '0.0' : pattern.format(value ?? 0);
  }

  static String fieldFormat(String? value) {
    var pattern = NumberFormat("###,###", "en_US");
    return pattern.format(int.parse(value ?? '0'));
  }

  static String fieldDoubleFormat(String? value) {
    final split = value?.replaceAll(',', '').split('.');
    var pattern = NumberFormat("###,###", "en_US");
    return pattern.format(int.parse(split?[0] ?? '0')) +
        (split!.length > 1 ? '.${split[1]}' : '');
  }
}
