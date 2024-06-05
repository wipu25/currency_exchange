import 'package:currency_exchange/constants/app_colors.dart';
import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/presentation/calculate/models/exchange_screen_state.dart';
import 'package:currency_exchange/presentation/exchange/exchange_notifier.dart';
import 'package:currency_exchange/presentation/exchange/widgets/price_cell.dart';
import 'package:currency_exchange/presentation/widgets/country_label.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:currency_exchange/presentation/widgets/loading.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExchangeScreen extends ConsumerWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCurrency = ref.watch(exchangeNotifier);
    return switch (asyncCurrency) {
      AsyncData(:final value) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  AppStrings.currency,
                  AppStrings.price,
                  AppStrings.buying,
                  AppStrings.selling
                ]
                    .map((item) => Expanded(
                            child: Center(
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.blueAccent),
                          ),
                        )))
                    .toList(),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ...List.generate(
                      ref.watch(currencyListProvider).currencyList.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                        offset: const Offset(2, 2),
                                        color: Colors.black.withOpacity(0.2))
                                  ]),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                      flex: 2,
                                      child: currencyInfo(ref
                                          .watch(currencyListProvider)
                                          .currencyList[index])),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      children: List.generate(
                                          ref
                                              .watch(currencyListProvider)
                                              .currencyList[index]
                                              .buyPriceRange
                                              .length,
                                          (buyItem) => Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            blurRadius: 2,
                                                            spreadRadius: 1,
                                                            offset:
                                                                const Offset(
                                                                    2, 2),
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.2))
                                                      ]),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          child: priceRange(ref
                                                                  .watch(
                                                                      currencyListProvider)
                                                                  .currencyList[
                                                                      index]
                                                                  .buyPriceRange[
                                                              buyItem])),
                                                      Expanded(
                                                        child: PriceCell(
                                                          bgColor:
                                                              AppColors.bgRed,
                                                          value: ref
                                                                  .watch(
                                                                      currencyListProvider)
                                                                  .buyCurrencyList[
                                                              index][buyItem],
                                                          isEdit: value ==
                                                              ExchangeState
                                                                  .edit,
                                                          onChange: (value) => ref
                                                              .read(
                                                                  exchangeNotifier
                                                                      .notifier)
                                                              .addRate(
                                                                  index,
                                                                  buyItem,
                                                                  value,
                                                                  PriceType
                                                                      .buy),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 12),
                                                      Expanded(
                                                        child: PriceCell(
                                                          bgColor:
                                                              AppColors.bgGreen,
                                                          value: ref
                                                                  .watch(
                                                                      currencyListProvider)
                                                                  .sellCurrencyList[
                                                              index][buyItem],
                                                          isEdit: value ==
                                                              ExchangeState
                                                                  .edit,
                                                          onChange: (value) => ref
                                                              .read(
                                                                  exchangeNotifier
                                                                      .notifier)
                                                              .addRate(
                                                                  index,
                                                                  buyItem,
                                                                  value,
                                                                  PriceType
                                                                      .sell),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      onPressed: value == ExchangeState.save
                          ? () => ref.read(exchangeNotifier.notifier).onSave()
                          : value == ExchangeState.edit
                              ? () =>
                                  ref.read(exchangeNotifier.notifier).onEdit()
                              : null,
                      text: value == ExchangeState.save
                          ? AppStrings.save
                          : AppStrings.edit,
                      bgColor: value == ExchangeState.save
                          ? Colors.lightBlueAccent
                          : value == ExchangeState.edit
                              ? Colors.lightBlueAccent
                              : Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      AsyncError(:final error) => const Text(AppStrings.errorNetwork),
      _ => const Loading(),
    };
  }

  Widget currencyInfo(Country item) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: CountryLabel(
        logo: item.logo,
        currency: item.currency,
        fullCountry: item.countryName,
      ),
    );
  }

  Widget priceRange(PriceRange price) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        price.getRange(),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
