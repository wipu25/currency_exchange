import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/presentation/calculate/notifier/summary_panel_notifier.dart';
import 'package:currency_exchange/presentation/exchange/models/exchange_item.dart';
import 'package:currency_exchange/presentation/widgets/item_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SummaryItem extends StatelessWidget {
  final List<ExchangeItem> itemList;
  const SummaryItem({super.key, required this.itemList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: [
          ...List.generate(itemList.length, (index) {
            final item = itemList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ItemContainer(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: item.transaction == Transaction.buy
                                  ? Colors.lightGreen.withOpacity(0.5)
                                  : Colors.red.withOpacity(0.5),
                            ),
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '${item.transaction.name.toUpperCase()} ${item.currency}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ...List.generate(
                              item.priceRange.length,
                              (index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      flexibleText(
                                          '${AppStrings.range} ${item.priceRange[index].getRange()}'),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      flexibleText(
                                          '${AppStrings.price} ${item.priceRange[index].getPrice()} X ${item.calculatedItem[index].getAmount()}'),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      flexibleText(
                                          '= ${item.calculatedItem[index].getPrice()}'),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                    ],
                                  )).toList(),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                    Consumer(
                      builder: (_, ref, __) => GestureDetector(
                        onTap: () => ref
                            .read(summaryPanelNotifier.notifier)
                            .removeItem(index),
                        child: Container(
                          width: 40,
                          color: Colors.red.withOpacity(0.2),
                          child: const Icon(
                            Icons.delete,
                            size: 32,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

Widget flexibleText(String text) {
  return Row(
    children: [
      Expanded(
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
