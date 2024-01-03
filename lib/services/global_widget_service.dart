import 'package:flutter/cupertino.dart';

class GlobalWidgetService with ChangeNotifier {
  MenuSelect _menuSelect = MenuSelect.exchanges;
  bool _isExpand = false;

  bool get isExpand => _isExpand;
  MenuSelect get menuSelect => _menuSelect;

  void switchScreen(MenuSelect menuSelect) {
    _menuSelect = menuSelect;
    notifyListeners();
  }

  void expand() {
    _isExpand = !_isExpand;
    notifyListeners();
  }
}

enum MenuSelect {
  exchanges,
  calculate,
  history,
  sales;

  String get name {
    switch (this) {
      case MenuSelect.exchanges:
        return 'อัตราแลกเงิน';
      case MenuSelect.calculate:
        return 'คำนวณ';
      case MenuSelect.history:
        return 'ประวัติ';
      case MenuSelect.sales:
        return 'ยอด';
    }
  }
}
