import 'package:currency_exchange/presentation/calculate/calculate_screen.dart';
import 'package:currency_exchange/presentation/exchange/exchange_screen.dart';
import 'package:currency_exchange/presentation/history/history_screen.dart';
import 'package:currency_exchange/presentation/sales/sales_screen.dart';
import 'package:currency_exchange/presentation/widgets/menu_side_bar.dart';
import 'package:currency_exchange/services/global_widget_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              child: Consumer(
                builder: (_, ref, __) => Text(
                  ref.watch(menuSelectStateProvider).menuSelect.name,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Consumer(builder: (_, ref, __) {
                    final menuProviderWatch =
                        ref.watch(menuSelectStateProvider);
                    return MenuSideBar(
                      menuSelect: menuProviderWatch.menuSelect,
                      isExpand: menuProviderWatch.isExpand,
                      expandMenu: () =>
                          ref.read(menuSelectStateProvider.notifier).expand(),
                      selectedMenu: (MenuSelect itemMenu) => ref
                          .read(menuSelectStateProvider.notifier)
                          .switchScreen(itemMenu),
                    );
                  }),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Consumer(
                          builder: (_, ref, __) => screenSelect(
                              ref.watch(menuSelectStateProvider).menuSelect),
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
