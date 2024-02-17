import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:flutter/material.dart';

class DisplayMoreInfoDialog extends StatelessWidget {
  final TransactionItem item;
  const DisplayMoreInfoDialog({super.key, required this.item});

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
                                      e.getPrice(),
                                      style: const TextStyle(fontSize: 16),
                                    ))
                                .toList(),
                          )),
                          flexibleText(
                              item.calculatedItem[index].getAmountExchange()),
                          flexibleText(
                              item.calculatedItem[index].getTotalPrice()),
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
        const SizedBox(
          height: 8,
        ),
        if (item.totalBuyPrice != null && item.totalBuyPrice! > 0.0)
          Text(
            "${AppStrings.totalBuy} ${item.getTotalBuyPrice()} ${AppStrings.thb}",
            style: const TextStyle(fontSize: 24),
          ),
        if (item.totalSellPrice != null && item.totalSellPrice! > 0.0)
          Text(
            "${AppStrings.totalSell} ${item.getTotalSellPrice()} ${AppStrings.thb}",
            style: const TextStyle(fontSize: 24),
          ),
        Text(
          '${item.paymentMethod == PaymentMethod.cancel ? '' : AppStrings.paymentMethod} ${item.paymentMethod.name}',
          style: TextStyle(
              fontSize: 24,
              color: item.paymentMethod == PaymentMethod.cancel
                  ? Colors.redAccent
                  : Colors.black),
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
