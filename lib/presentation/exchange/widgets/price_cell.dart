import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/helpers/number_format.dart';
import 'package:currency_exchange/main.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PriceCell extends ConsumerWidget {
  final List<List<String?>> currencyList;
  final int currencyIndex;
  final PriceType priceType;
  const PriceCell(
      {super.key,
      required this.currencyList,
      required this.currencyIndex,
      required this.priceType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (_, exchangeController, child) {
      return TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              currencyList[currencyIndex].length,
              (index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: !ref.watch(exchangeProvider).isEdit
                    ? Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          CustomNumberFormat.fieldDoubleFormat(
                              currencyList[currencyIndex][index] ?? '0.0'),
                          style: const TextStyle(fontSize: 20),
                        ),
                      )
                    : CustomTextField(
                        value: CustomNumberFormat.fieldDoubleFormat(
                            currencyList[currencyIndex][index]),
                        onChanged: (value) {
                          try {
                            ref.watch(exchangeProvider).addRate(
                                currencyIndex, index, value, priceType);
                            ScaffoldMessenger.of(context).clearSnackBars();
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(e is CalculateException
                                  ? e.message
                                  : AppStrings.notNumberAlert),
                              duration: const Duration(seconds: 3),
                            ));
                          }
                        },
                      ),
              ),
            ).toList(),
          ),
        ),
      );
    });
  }
}
