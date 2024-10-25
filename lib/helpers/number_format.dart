import 'package:intl/intl.dart';

class CustomNumberFormat {
  static String commaFormat6(double? value) {
    var pattern = NumberFormat("###,##0.0#####", "en_US");
    return value == 0 ? '0.0' : pattern.format(value ?? 0);
  }

  static String commaFormat5(double? value) {
    var pattern = NumberFormat("###,##0.0####", "en_US");
    return value == 0 ? '0.0' : pattern.format(value ?? 0);
  }

  static String commaFormat1(double? value) {
    var pattern = NumberFormat("###,##0.#", "en_US");
    return value == 0 ? '0.0' : pattern.format(value ?? 0);
  }

  static String fieldFormat(String? value) {
    var pattern = NumberFormat("###,###", "en_US");
    return pattern.format(int.parse(value ?? '0'));
  }

  static String fieldDoubleFormat(String? value) {
    final split = value?.replaceAll(',', '').split('.');
    var pattern = NumberFormat("###,###", "en_US");
    if (split == null) {
      return '0';
    }
    if (split[0].isEmpty) {
      return '';
    }
    return pattern.format(int.parse(split[0])) +
        (split.length > 1 ? '.${split[1]}' : '');
  }
}
