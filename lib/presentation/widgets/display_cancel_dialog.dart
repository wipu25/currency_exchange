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
            '${AppStrings.cancellingTime} ${item.dateTime.split('_')[0]} ${item.dateTime.split('_')[1]}'),
        const SizedBox(
          height: 4,
        ),
        const Divider(
          height: 2,
        ),
        const SizedBox(
          height: 4,
        ),
        ...List.generate(
            item.calculatedItem.length,
            (index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(item.calculatedItem[index].transaction)),
                      Expanded(
                          child: Text(item.calculatedItem[index].currency)),
                      Expanded(
                          child: Column(
                        children: item.calculatedItem[index].priceRange
                            .map((e) => Text(e.getRange()))
                            .toList(),
                      )),
                      Expanded(
                          child: Column(
                        children: item.calculatedItem[index].priceRange
                            .map((e) => Text(e.price.toString()))
                            .toList(),
                      )),
                      Expanded(
                          child: Text(item.calculatedItem[index].amountExchange
                              .toString())),
                      Expanded(
                          child: Text(item.calculatedItem[index].totalPrice
                              .toString())),
                    ],
                  ),
                )).toList(),
        const SizedBox(
          height: 4,
        ),
        const Divider(
          height: 2,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          '${AppStrings.paymentMethod} ${item.paymentMethod.name}',
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
