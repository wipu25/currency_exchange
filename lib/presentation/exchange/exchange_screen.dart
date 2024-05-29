import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/presentation/exchange/exchange_notifier.dart';
import 'package:currency_exchange/presentation/exchange/widgets/price_cell.dart';
import 'package:currency_exchange/presentation/widgets/country_label.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:currency_exchange/presentation/widgets/custom_table.dart';
import 'package:currency_exchange/presentation/widgets/header_cell.dart';
import 'package:currency_exchange/presentation/widgets/loading.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExchangeScreen extends ConsumerWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Consumer(
          builder: (_, ref, child) =>
              ref.watch(exchangeNotifier).isCurrencyLoading
                  ? const Center(child: Loading())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(32)),
                          ),
                          child: CustomTable(
                            column: 4,
                            children: [
                              const TableRow(children: [
                                HeaderCell(text: AppStrings.currency),
                                HeaderCell(text: AppStrings.denomination),
                                HeaderCell(text: AppStrings.buying),
                                HeaderCell(text: AppStrings.selling),
                              ]),
                              ...List.generate(
                                ref.watch(currencyListProvider).currencyList.length,
                                (currencyIndex) {
                                  final item = ref
                                      .watch(currencyListProvider)
                                      .currencyList[currencyIndex];
                                  return TableRow(children: [
                                    currencyInfo(item),
                                    priceRange(item),
                                    PriceCell(
                                      currencyList: ref
                                          .watch(currencyListProvider)
                                          .buyCurrencyList,
                                      currencyIndex: currencyIndex,
                                      priceType: PriceType.buy,
                                    ),
                                    PriceCell(
                                      currencyList: ref
                                          .watch(currencyListProvider)
                                          .sellCurrencyList,
                                      currencyIndex: currencyIndex,
                                      priceType: PriceType.sell,
                                    ),
                                  ]);
                                },
                              ).toList()
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomButton(
                          onPressed: ref.watch(exchangeNotifier).isSave
                              ? () => ref.read(exchangeNotifier.notifier).onSave()
                              : !ref.watch(exchangeNotifier).isEdit
                                  ? () => ref.read(exchangeNotifier.notifier).onEdit()
                                  : null,
                          text: ref.watch(exchangeNotifier).isSave
                              ? AppStrings.save
                              : ref.watch(exchangeNotifier).isEdit
                                  ? AppStrings.save
                                  : AppStrings.edit,
                          bgColor: ref.watch(exchangeNotifier).isSave
                              ? Colors.lightBlueAccent
                              : !ref.watch(exchangeNotifier).isEdit
                                  ? Colors.lightBlueAccent
                                  : Colors.grey,
                        )
                      ],
                    )),
    );
  }

  Widget currencyInfo(Country item) {
    return TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CountryLabel(
            logo: item.logo,
            currency: item.currency,
            fullCountry: item.countryName,
          ),
        ));
  }

  Widget priceRange(Country item) {
    return TableCell(
        verticalAlignment: TableCellVerticalAlignment.fill,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: item.buyPriceRange.length == 1
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: item.buyPriceRange
                  .map((price) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          price.getRange(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ))
                  .toList()),
        ));
  }
}
