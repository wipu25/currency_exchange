import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/presentation/exchange/exchange_controller.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriceCell extends StatelessWidget {
  final List<PriceRange> priceRange;
  final int currencyIndex;
  final PriceType priceType;
  const PriceCell(
      {super.key,
      required this.priceRange,
      required this.currencyIndex,
      required this.priceType});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExchangeController>(
        builder: (_, exchangeController, child) {
      return TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                priceRange.length,
                (priceIndex) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: !exchangeController.isEdit
                          ? Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                '${priceRange[priceIndex].price ?? ''}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            )
                          : CustomTextField(
                              value: exchangeController.checkCurrentEdit(
                                      currencyIndex, priceIndex, priceType)
                                  ? exchangeController.editText
                                  : priceRange[priceIndex].price?.toString(),
                              onChanged: (value) {
                                try {
                                  exchangeController.addRate(currencyIndex,
                                      priceIndex, value, priceType);
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                } catch (e) {
                                  ScaffoldMessenger.of(context)
                                      .removeCurrentSnackBar();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(e is CalculateException
                                        ? e.message
                                        : AppStrings.notNumberAlert),
                                    duration: const Duration(seconds: 3),
                                  ));
                                }
                              },
                            ),
                    )).toList(),
          ),
        ),
      );
    });
  }
}
