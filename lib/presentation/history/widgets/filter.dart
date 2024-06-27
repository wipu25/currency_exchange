import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/presentation/history/models/history_filter_state.dart';
import 'package:currency_exchange/presentation/history/notifiers/filter_notifier.dart';
import 'package:currency_exchange/presentation/history/notifiers/history_notifier.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Filter extends ConsumerWidget {
  const Filter({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text(AppStrings.filter),
      actions: <Widget>[
        CustomButton(
          onPressed: () =>
              ref.read(filterNotifier.notifier).selectAllCurrencyFilter(true),
          text: AppStrings.selectAll,
          bgColor: Colors.blueAccent,
        ),
        CustomButton(
          onPressed: () =>
              ref.read(filterNotifier.notifier).selectAllCurrencyFilter(false),
          text: AppStrings.deselectAll,
          bgColor: Colors.blueAccent,
        ),
        CustomButton(
          onPressed: () {
            ref.read(filterNotifier.notifier).saveFilter();
            ref.read(historyNotifier.notifier).filterItem();
            Navigator.of(context).pop();
          },
          text: AppStrings.save,
          bgColor: Colors.blueAccent,
        ),
      ],
      content: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            FilterColumn(
                AppStrings.currency,
                ref
                    .watch(currencyListProvider)
                    .currencyList
                    .map((e) => e.currency)
                    .toList(),
                FilterType.currency),
            const SizedBox(
              width: 32,
            ),
            FilterColumn(
                AppStrings.paymentMethod,
                PaymentMethod.values.map((e) => e.getString()).toList(),
                FilterType.payment),
            const SizedBox(
              width: 32,
            ),
            FilterColumn(
                AppStrings.transaction,
                Transaction.values.map((e) => e.getString()).toList(),
                FilterType.transaction),
          ],
        ),
      ),
    );
  }
}

class FilterColumn extends StatelessWidget {
  final String title;
  final List<String> items;
  final FilterType filterType;
  const FilterColumn(this.title, this.items, this.filterType, {super.key});

  @override
  Widget build(BuildContext context) {
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
            ...List.generate(
                items.length,
                (index) => Row(
                      children: [
                        Consumer(
                            builder: (_, ref, __) => Checkbox(
                                value: _getFilterValue(
                                    ref.watch(filterNotifier), index),
                                onChanged: (value) => ref
                                    .read(filterNotifier.notifier)
                                    .updateFilter(value, index, filterType))),
                        Text(items[index])
                      ],
                    )),
          ],
        ),
      ],
    );
  }

  bool _getFilterValue(HistoryFilterState state, int index) {
    switch (filterType) {
      case FilterType.payment:
        return state.selectPaymentFilter[index];
      case FilterType.currency:
        return state.selectCurrencyFilter[index];
      default:
        return state.selectTransactionFilter[index];
    }
  }
}
