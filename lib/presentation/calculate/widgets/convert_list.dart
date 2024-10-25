import 'package:thanarak_exchange/constants/app_strings.dart';
import 'package:thanarak_exchange/helpers/number_format.dart';
import 'package:thanarak_exchange/models/exception.dart';
import 'package:thanarak_exchange/models/price_range.dart';
import 'package:thanarak_exchange/presentation/calculate/notifier/calculate_notifier.dart';
import 'package:thanarak_exchange/presentation/widgets/item_container.dart';
import 'package:thanarak_exchange/presentation/widgets/nth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConvertList extends ConsumerWidget {
  const ConvertList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculateState = ref.watch(calculateNotifier);
    final calculateFunction = ref.watch(calculateNotifier.notifier);
    return ListView.builder(
        itemCount: calculateState.calculatedItem.length,
        itemBuilder: (context, index) {
          final inputTextController =
              TextEditingController(text: calculateFunction.inputPrice[index]);
          inputTextController.selection = TextSelection.fromPosition(
              TextPosition(offset: calculateFunction.inputPrice[index].length));
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ItemContainer(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    !calculateFunction.isTransactionBuy
                        ? AppStrings.thb
                        : calculateState.selectedCurrency?.currency ?? '',
                    style: const TextStyle(fontSize: 14),
                  ),
                  priceRange(
                      calculateFunction.isTransactionBuy,
                      calculateState.selectedCurrency!.buyPriceRange,
                      calculateState.calculatedItem[index].priceRange!,
                      (value) => calculateFunction.updateSelectedPriceRange(
                          index, value)),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      AppStrings.amount,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    child: TextField(
                      controller: inputTextController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 18),
                      cursorColor: Colors.blueAccent,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(16.0),
                        hintText: '0.00',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0),
                        ),
                      ),
                      onChanged: (value) {
                        try {
                          calculateFunction.calculateAmount(index, value);
                          ScaffoldMessenger.of(context).clearSnackBars();
                        } catch (e) {
                          calculateFunction.disableAdd();
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
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
                  Text(
                    !calculateFunction.isTransactionBuy
                        ? AppStrings.thb
                        : calculateState.selectedCurrency?.currency ?? '',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(AppStrings.convert,
                        style: TextStyle(fontSize: 14)),
                  ),
                  Text(
                    CustomNumberFormat.commaFormat5(
                        calculateState.calculatedItem[index].price),
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    calculateFunction.isTransactionBuy
                        ? AppStrings.thb
                        : calculateState.selectedCurrency?.currency ?? '',
                    style: const TextStyle(fontSize: 12),
                  ),
                  if (calculateFunction.inputPrice.length > 1)
                    InkWell(
                      onTap: () => calculateFunction.removeSplitItem(index),
                      child: const Icon(Icons.delete),
                    )
                ],
              ),
            ),
          );
        });
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
    return ItemContainer(
      borderRadius: BorderRadius.circular(4.0),
      child: DropdownButton<PriceRange>(
        underline: const Nth(),
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
      ),
    );
  }
}
