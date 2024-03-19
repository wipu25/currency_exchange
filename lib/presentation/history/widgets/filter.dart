import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/presentation/history/history_controller.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Filter extends StatelessWidget {
  final HistoryController historyController;

  const Filter({super.key, required this.historyController});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text(AppStrings.filter),
        actions: <Widget>[
          CustomButton(
            onPressed: () => historyController.selectAllFilter(true),
            text: AppStrings.selectAll,
            bgColor: Colors.blueAccent,
          ),
          CustomButton(
            onPressed: () => historyController.selectAllFilter(false),
            text: AppStrings.deselectAll,
            bgColor: Colors.blueAccent,
          ),
          CustomButton(
            onPressed: () {
              historyController.filterItem();
              Navigator.of(context).pop();
            },
            text: AppStrings.save,
            bgColor: Colors.blueAccent,
          ),
        ],
        content: ChangeNotifierProvider.value(
          value: historyController,
          child:
              Consumer<HistoryController>(builder: (_, historyController, __) {
            return SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  filterColumn(AppStrings.currency,
                      historyController.currencyFilter, FilterType.currency),
                  const SizedBox(
                    width: 32,
                  ),
                  filterColumn(AppStrings.paymentMethod,
                      historyController.paymentFilter, FilterType.payment),
                  const SizedBox(
                    width: 32,
                  ),
                  filterColumn(
                      AppStrings.transaction,
                      historyController.transactionFilter,
                      FilterType.transaction),
                ],
              ),
            );
          }),
        ));
  }

  Widget filterColumn(
      String title, Map<String, bool> items, FilterType filterType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 28),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...items.entries
                .map((item) => Row(
                      children: [
                        Checkbox(
                            value: item.value,
                            onChanged: (value) => historyController
                                .updateFilter(item.key, value, filterType)),
                        Text(item.key)
                      ],
                    ))
                .toList()
          ],
        ),
      ],
    );
  }
}
