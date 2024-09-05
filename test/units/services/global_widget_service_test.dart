import 'package:thanarak_exchange/services/global_widget_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GlobalWidgetService globalWidgetService;

  setUpAll(() {
    globalWidgetService = GlobalWidgetService();
  });

  test('Verify expand menu', () {
    globalWidgetService.expand();
    expect(globalWidgetService.isExpand, true);
  });

  test('Verify switch screen', () {
    globalWidgetService.switchScreen(MenuSelect.calculate);
    expect(globalWidgetService.menuSelect, MenuSelect.calculate);
  });
}
