import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/presentation/history/history_notifier.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
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
              ref.read(historyNotifier.notifier).selectAllFilter(true),
          text: AppStrings.selectAll,
          bgColor: Colors.blueAccent,
        ),
        CustomButton(
          onPressed: () =>
              ref.read(historyNotifier.notifier).selectAllFilter(false),
          text: AppStrings.deselectAll,
          bgColor: Colors.blueAccent,
        ),
        CustomButton(
          onPressed: () {
            ref.read(historyNotifier.notifier).filterItem();
            Navigator.of(context).pop();
          },
          text: AppStrings.save,
          bgColor: Colors.blueAccent,
        ),
      ],
      content: Consumer(builder: (_, ref, __) {
        return SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              FilterColumn(
                  AppStrings.currency,
                  ref.watch(historyNotifier).currencyFilter,
                  FilterType.currency),
              const SizedBox(
                width: 32,
              ),
              FilterColumn(AppStrings.paymentMethod,
                  ref.watch(historyNotifier).paymentFilter, FilterType.payment),
              const SizedBox(
                width: 32,
              ),
              FilterColumn(
                  AppStrings.transaction,
                  ref.watch(historyNotifier).transactionFilter,
                  FilterType.transaction),
            ],
          ),
        );
      }),
    );
  }
}

class FilterColumn extends ConsumerWidget {
  final String title;
  final Map<String, bool> items;
  final FilterType filterType;
  const FilterColumn(this.title, this.items, this.filterType, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                            onChanged: (value) => ref
                                .read(historyNotifier.notifier)
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
