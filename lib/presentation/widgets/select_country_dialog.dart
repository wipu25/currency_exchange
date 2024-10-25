import 'package:thanarak_exchange/constants/app_colors.dart';
import 'package:thanarak_exchange/helpers/text_style_helper.dart';
import 'package:thanarak_exchange/models/receipt.dart';
import 'package:thanarak_exchange/presentation/calculate/notifier/calculate_notifier.dart';
import 'package:thanarak_exchange/presentation/widgets/country_label.dart';
import 'package:thanarak_exchange/services/currency_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectCountryDialog extends ConsumerWidget {
  const SelectCountryDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
              ref.watch(currencyListProvider).currencyList.length, (index) {
            final item = ref.watch(currencyListProvider).currencyList[index];
            final selectedCurrency =
                ref.watch(calculateNotifier).selectedCurrency;
            final transaction = ref.watch(calculateNotifier).transaction;
            return GestureDetector(
              onTap: () => ref
                  .read(calculateNotifier.notifier)
                  .setSelectedCurrency(item),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: item == selectedCurrency
                          ? Colors.blueAccent
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(color: Colors.black)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: CountryLabel(
                          logo: item.logo,
                          currency: item.currency,
                          fullCountry: item.countryName,
                          textColor: item == selectedCurrency
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      if (transaction == Transaction.sell)
                        SizedBox(
                          width: 100,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.bgRed,
                                borderRadius: BorderRadius.circular(16)),
                            child: Column(
                              children: ref
                                  .watch(currencyListProvider)
                                  .sellCurrencyList[index]
                                  .map((item) => Text(item ?? '',
                                      style: TextStyleHelper.bodyBlack3))
                                  .toList(),
                            ),
                          ),
                        ),
                      if (transaction == Transaction.buy)
                        SizedBox(
                          width: 200,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(item.buyPriceRange.length,
                                  (subIndex) {
                                final buyRange =
                                    item.buyPriceRange[subIndex].getRange();
                                final price = ref
                                    .watch(currencyListProvider)
                                    .buyCurrencyList[index][subIndex];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    decoration: BoxDecoration(
                                        color: AppColors.bgGreen,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(buyRange,
                                            style: TextStyleHelper.bodyBlack3),
                                        Text(price ?? '',
                                            style: TextStyleHelper.bodyBlack3)
                                      ],
                                    ),
                                  ),
                                );
                              })),
                        )
                    ],
                  ),
                ),
              ),
            );
          }),
          // children: ref.watch(currencyListProvider).currencyList.map((item) {
          //   final selectedCurrency =
          //       ref.watch(calculateNotifier).selectedCurrency;
          //   return GestureDetector(
          //     onTap: () => ref
          //         .read(calculateNotifier.notifier)
          //         .setSelectedCurrency(item),
          //     child: Container(
          //       padding: const EdgeInsets.all(8.0),
          //       decoration: BoxDecoration(
          //           color: item == selectedCurrency
          //               ? Colors.blueAccent
          //               : Colors.white,
          //           borderRadius: BorderRadius.circular(16.0)),
          //       child: Row(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           SizedBox(
          //             width: 200,
          //             child: CountryLabel(
          //               logo: item.logo,
          //               currency: item.currency,
          //               fullCountry: item.countryName,
          //               textColor:
          //                   item == selectedCurrency ? Colors.white : Colors.black,
          //             ),
          //           ),
          //           Text('test')
          //         ],
          //       ),
          //     ),
          //   );
          // }).toList()
        ),
      ),
    );
  }
}
