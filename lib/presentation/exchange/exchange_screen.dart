import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/presentation/exchange/exchange_controller.dart';
import 'package:currency_exchange/presentation/exchange/widgets/price_cell.dart';
import 'package:currency_exchange/presentation/widgets/country_label.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:currency_exchange/presentation/widgets/custom_table.dart';
import 'package:currency_exchange/presentation/widgets/header_cell.dart';
import 'package:currency_exchange/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currency = context.read<ExchangeController>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Consumer<ExchangeController>(
          builder: (_, exchangeController, child) =>
              exchangeController.isCurrencyLoading
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
                                exchangeController.currencyList.length,
                                (currencyIndex) {
                                  final item = exchangeController
                                      .currencyList[currencyIndex];
                                  return TableRow(children: [
                                    currencyInfo(item),
                                    priceRange(item),
                                    PriceCell(
                                      currencyList:
                                          exchangeController.buyCurrencyList,
                                      currencyIndex: currencyIndex,
                                      priceType: PriceType.buy,
                                    ),
                                    PriceCell(
                                      currencyList:
                                          exchangeController.sellCurrencyList,
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
                          onPressed: exchangeController.isSaveEnable
                              ? () => currency.onSave()
                              : !exchangeController.isEdit
                                  ? () => currency.onEdit()
                                  : null,
                          text: exchangeController.isSaveEnable
                              ? AppStrings.save
                              : exchangeController.isEdit
                                  ? AppStrings.save
                                  : AppStrings.edit,
                          bgColor: exchangeController.isSaveEnable
                              ? Colors.lightBlueAccent
                              : !exchangeController.isEdit
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
                          '${price.min ?? '0'} - ${price.max ?? '~'}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ))
                  .toList()),
        ));
  }
}
