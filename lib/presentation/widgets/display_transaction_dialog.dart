import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:currency_exchange/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';

class DisplayTransactionDialog extends StatelessWidget {
  final TransactionItem? currentTransaction;
  const DisplayTransactionDialog({super.key, required this.currentTransaction});

  @override
  Widget build(BuildContext context) {
    return currentTransaction != null
        ? Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            ...currentTransaction!.calculatedItem
                .map((index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
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
            Row(
              children: [
                if (currentTransaction?.totalBuyPrice != null &&
                    currentTransaction!.totalBuyPrice! > 0.0)
                  Column(
                    children: [
                      const Text(
                        AppStrings.enTotalBuy,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        "${currentTransaction!.totalBuyPrice} ${AppStrings.thb}",
                        style: const TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                const Spacer(),
                if (currentTransaction?.totalBuyPrice != null &&
                    currentTransaction!.totalSellPrice! > 0.0)
                  Column(
                    children: [
                      const Text(
                        AppStrings.enTotalSell,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        "${currentTransaction!.totalSellPrice} ${AppStrings.thb}",
                        style: const TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
              ],
            ),
            const Text(
              AppStrings.enPaymentMethod,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              currentTransaction!.paymentMethod.getString(),
              style: const TextStyle(fontSize: 30),
            ),
          ])
        : const Loading();
  }
}
