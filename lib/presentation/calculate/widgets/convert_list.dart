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
              children: List.generate(
                  calculateControllers.selectedPriceRange.length, (index) {
                final inputTextController = TextEditingController(
                    text: calculateControllers.inputPrice[index]);
                inputTextController.selection = TextSelection.fromPosition(
                    TextPosition(
                        offset: calculateControllers.inputPrice[index].length));
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(!calculateControllers.isTransactionBuy
                        ? AppStrings.thb
                        : calculateControllers.selectedCountry?.currency ?? ''),
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
                      width: 16,
                    ),
                    const Text(AppStrings.amount),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: inputTextController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(hintText: '0.00'),
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
                    Text(!calculateControllers.isTransactionBuy
                        ? AppStrings.thb
                        : calculateControllers.selectedCountry?.currency ?? ''),
                    const SizedBox(
                      width: 24,
                    ),
                    const Text(AppStrings.convert),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(CustomNumberFormat.commaFormat(
                        calculateControllers.calculatedItem[index].price)),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(calculateControllers.isTransactionBuy
                        ? AppStrings.thb
                        : calculateControllers.selectedCountry?.currency ?? ''),
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
      return Text('${buyRange.first.min ?? 0} - ${buyRange.first.max ?? '~'}');
    }
    return DropdownButton<PriceRange>(
      value: selectRange,
      items: buyRange
          .map<DropdownMenuItem<PriceRange>>((price) =>
              DropdownMenuItem(value: price, child: Text(price.getRange())))
          .toList(),
      onChanged: (value) {
        if (value != null) {
          onSelected(value);
        }
      },
    );
  }
}
