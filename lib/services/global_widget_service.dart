import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuSelectStateProvider =
    StateNotifierProvider<MenuStateNotifier, MenuState>(
        (ref) => MenuStateNotifier());

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

class MenuState {
  final MenuSelect menuSelect;
  final bool isExpand;

  MenuState(this.menuSelect, this.isExpand);
}

class MenuStateNotifier extends StateNotifier<MenuState> {
  MenuStateNotifier() : super(MenuState(MenuSelect.exchanges, false));

  void switchScreen(MenuSelect menuSelect) =>
      state = MenuState(menuSelect, state.isExpand);
  void expand() => state = MenuState(state.menuSelect, !state.isExpand);
}
