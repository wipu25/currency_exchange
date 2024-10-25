import 'package:thanarak_exchange/constants/app_strings.dart';

enum BillOperation {
  save,
  print,
  none;

  String getString() {
    switch (this) {
      case BillOperation.save:
        return AppStrings.save;
      case BillOperation.print:
        return AppStrings.print;
      case BillOperation.none:
        return '';
    }
  }
}

enum ClientField { name, id, address }
