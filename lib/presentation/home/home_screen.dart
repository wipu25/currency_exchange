import 'package:currency_exchange/presentation/calculate/calculate_screen.dart';
import 'package:currency_exchange/presentation/exchange/exchange_screen.dart';
import 'package:currency_exchange/presentation/history/history_screen.dart';
import 'package:currency_exchange/presentation/sales/sales_screen.dart';
import 'package:currency_exchange/presentation/widgets/menu_side_bar.dart';
import 'package:currency_exchange/services/global_widget_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Consumer<GlobalWidgetService>(
                builder: (_, globalWidgetService, __) => Text(
                  globalWidgetService.menuSelect.name,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Consumer<GlobalWidgetService>(
                    builder: (_, globalWidgetService, __) => MenuSideBar(
                      menuSelect: globalWidgetService.menuSelect,
                      isExpand: globalWidgetService.isExpand,
                      expandMenu: () => globalWidgetService.expand(),
                      selectedMenu: (MenuSelect itemMenu) =>
                          globalWidgetService.switchScreen(itemMenu),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Consumer<GlobalWidgetService>(
                          builder: (_, globalWidgetService, __) =>
                              screenSelect(globalWidgetService.menuSelect),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget screenSelect(MenuSelect itemMenu) {
    switch (itemMenu) {
      case MenuSelect.exchanges:
        return const ExchangeScreen();
      case MenuSelect.calculate:
        return const CalculateScreen();
      case MenuSelect.history:
        return const HistoryScreen();
      case MenuSelect.sales:
        return const SalesScreen();
    }
  }
}
