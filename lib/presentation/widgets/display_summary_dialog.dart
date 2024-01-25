import 'package:currency_exchange/models/exchange_item.dart';
import 'package:flutter/material.dart';

class DisplaySummaryDialog extends StatelessWidget {
  final List<ExchangeItem> currencyItem;
  const DisplaySummaryDialog({super.key, required this.currencyItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: currencyItem
          .map((index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(4.0),
                          color: index.transaction == 'buy'
                              ? Colors.lightGreen.withOpacity(0.5)
                              : Colors.red.withOpacity(0.5),
                          child: Text(
                            '${index.transaction.toUpperCase()} ${index.currency}',
                            style: const TextStyle(fontSize: 22),
                          )),
                      ...List.generate(
                          index.priceRange.length,
                          (item) => Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                          '${index.priceRange[item].min ?? 0.0} - ${index.priceRange[item].max ?? '~'}')),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                          '${index.calculatedItem[item].amount} X ${index.priceRange[item].price}')),
                                  Expanded(
                                      child: Text(
                                          '= ${index.calculatedItem[item].price}'))
                                ],
                              )),
                      // Text('Amount ${index.amountExchange} ${index.transaction == 'buy' ? index.currency : 'THB'}',style: const TextStyle(fontSize: 30),),
                      Text(
                        'Total ${index.totalPrice} ${index.transaction != 'buy' ? index.currency : 'THB'}',
                        style: const TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
