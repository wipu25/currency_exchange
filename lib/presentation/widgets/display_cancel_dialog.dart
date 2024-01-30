import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:flutter/material.dart';

class DisplayCancelDialog extends StatelessWidget {
  final TransactionItem item;
  const DisplayCancelDialog({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${AppStrings.cancellingTime} ${item.dateTime.split('_')[0]} ${item.dateTime.split('_')[1]}',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 4,
        ),
        const Divider(
          height: 2,
        ),
        const Text(
          AppStrings.totalItem,
          style: TextStyle(fontSize: 24),
        ),
        const Divider(
          height: 2,
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            flexibleText(AppStrings.transaction),
            flexibleText(AppStrings.currency),
            flexibleText(AppStrings.range),
            flexibleText(AppStrings.price),
            flexibleText(AppStrings.amount),
            flexibleText(AppStrings.totalPrice),
          ],
        ),
        ...List.generate(
            item.calculatedItem.length,
            (index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          flexibleText(item.calculatedItem[index].transaction
                              .toUpperCase()),
                          flexibleText(item.calculatedItem[index].currency),
                          Expanded(
                              child: Column(
                            children: item.calculatedItem[index].priceRange
                                .map((e) => Text(
                                      e.getRange(),
                                      style: const TextStyle(fontSize: 16),
                                    ))
                                .toList(),
                          )),
                          Expanded(
                              child: Column(
                            children: item.calculatedItem[index].priceRange
                                .map((e) => Text(
                                      e.price.toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ))
                                .toList(),
                          )),
                          flexibleText(item.calculatedItem[index].amountExchange
                              .toString()),
                          flexibleText(
                              item.calculatedItem[index].totalPrice.toString()),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Divider(
                      height: 2,
                    ),
                  ],
                )).toList(),
        Text(
          '${AppStrings.paymentMethod} ${item.paymentMethod.name}',
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }

  Widget flexibleText(String text) {
    return Expanded(
        child: Center(
      child: Text(
        text.toString(),
        style: const TextStyle(fontSize: 16),
      ),
    ));
  }
}
