import 'package:thanarak_exchange/constants/app_strings.dart';
import 'package:thanarak_exchange/models/receipt.dart';
import 'package:thanarak_exchange/models/transaction_item.dart';
import 'package:thanarak_exchange/presentation/widgets/loading.dart';
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
                                color: index.transaction == Transaction.buy
                                    ? Colors.lightGreen.withOpacity(0.5)
                                    : Colors.red.withOpacity(0.5),
                                child: Text(
                                  '${index.transaction.name.toUpperCase()} ${index.currency}',
                                  style: const TextStyle(fontSize: 24),
                                )),
                            ...List.generate(
                                index.calculatedItem.length,
                                (item) => Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                                index.calculatedItem[item]
                                                    .priceRange!
                                                    .getRange(),
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                ))),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                                '${index.calculatedItem[item].getAmount()} X ${index.calculatedItem[item].priceRange!.getPrice()}',
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                ))),
                                        Expanded(
                                            child: Text(
                                                '= ${index.calculatedItem[item].getPrice()}',
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                )))
                                      ],
                                    )),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Amount ${index.amountExchange} ${index.transaction == Transaction.buy ? index.currency : 'THB'}',
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              'Total ${index.getTotalPrice()} ${index.transaction != Transaction.buy ? index.currency : 'THB'}',
                              style: const TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                      ),
                    ))
                .toList(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (currentTransaction?.totalBuyPrice != null &&
                    currentTransaction!.totalBuyPrice! > 0.0)
                  Column(
                    children: [
                      const Text(
                        AppStrings.enTotalBuy,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${currentTransaction!.getTotalBuyPrice()} ${AppStrings.thb}",
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                if (currentTransaction?.totalBuyPrice != null &&
                    currentTransaction!.totalSellPrice! > 0.0) ...[
                  const SizedBox(width: 40),
                  Column(
                    children: [
                      const Text(
                        AppStrings.enTotalSell,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${currentTransaction!.getTotalSellPrice()} ${AppStrings.thb}",
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ]
              ],
            ),
            const Text(
              AppStrings.enPaymentMethod,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              currentTransaction!.paymentMethod.getString(),
              style: const TextStyle(fontSize: 24),
            ),
          ])
        : const Loading();
  }
}
