import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/helpers/number_format.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/presentation/calculate/calculate_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConvertList extends StatelessWidget {
  const ConvertList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculateController>(
        builder: (_, calculateControllers, __) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  calculateControllers.selectedPriceRange.length, (index) {
                final inputTextController = TextEditingController(
                    text: calculateControllers.inputPrice[index]);
                inputTextController.selection = TextSelection.fromPosition(
                    TextPosition(
                        offset: calculateControllers.inputPrice[index].length));
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      !calculateControllers.isTransactionBuy
                          ? AppStrings.thb
                          : calculateControllers.selectedCountry?.currency ??
                              '',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    priceRange(
                        calculateControllers.isTransactionBuy,
                        calculateControllers.selectedCountry!.buyPriceRange,
                        calculateControllers.selectedPriceRange[index],
                        (value) => calculateControllers
                            .updateSelectedPriceRange(index, value)),
                    const SizedBox(
                      width: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 7.0),
                      child: Text(
                        AppStrings.amount,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: 140,
                      child: TextField(
                        style: const TextStyle(fontSize: 18),
                        controller: inputTextController,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.blueAccent,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          hintText: '0.00',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 2.0),
                          ),
                        ),
                        onChanged: (value) {
                          try {
                            calculateControllers.calculateAmount(index, value);
                            ScaffoldMessenger.of(context).clearSnackBars();
                          } catch (e) {
                            calculateControllers.disableAdd();
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
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      !calculateControllers.isTransactionBuy
                          ? AppStrings.thb
                          : calculateControllers.selectedCountry?.currency ??
                              '',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 7.0),
                      child: Text(AppStrings.convert,
                          style: TextStyle(fontSize: 12)),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      // calculateControllers.selectedCountry?.currency == 'VND' ?
                      // CustomNumberFormat.commaFormat6(
                      //     calculateControllers.calculatedItem[index].price) :
                      CustomNumberFormat.commaFormat1(
                          calculateControllers.calculatedItem[index].price),
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      calculateControllers.isTransactionBuy
                          ? AppStrings.thb
                          : calculateControllers.selectedCountry?.currency ??
                              '',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    if (calculateControllers.inputPrice.length > 1)
                      InkWell(
                        onTap: () =>
                            calculateControllers.removeSplitItem(index),
                        child: const Icon(Icons.delete),
                      )
                  ],
                );
              }),
            ));
  }

  Widget priceRange(bool isBuy, List<PriceRange> buyRange,
      PriceRange selectRange, Function(PriceRange value) onSelected) {
    if (!isBuy) {
      return const SizedBox.shrink();
    }
    if (buyRange.length < 2) {
      return Text(
        '${buyRange.first.min ?? 0} - ${buyRange.first.max ?? '~'}',
        style: const TextStyle(fontSize: 18),
      );
    }
    return DropdownButton<PriceRange>(
      value: selectRange,
      items: buyRange
          .map<DropdownMenuItem<PriceRange>>((price) => DropdownMenuItem(
              value: price,
              child: Text(
                price.getRange(),
                style: const TextStyle(fontSize: 18),
              )))
          .toList(),
      onChanged: (value) {
        if (value != null) {
          onSelected(value);
        }
      },
    );
  }
}
