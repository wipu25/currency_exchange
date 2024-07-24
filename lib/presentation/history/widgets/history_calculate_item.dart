import 'package:currency_exchange/constants/app_colors.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/presentation/exchange/models/exchange_item.dart';
import 'package:currency_exchange/presentation/widgets/item_container.dart';
import 'package:flutter/material.dart';

class HistoryCalculateItem extends StatelessWidget {
  final List<ExchangeItem> exchangeItem;
  const HistoryCalculateItem({super.key, required this.exchangeItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(exchangeItem.length, (index) {
        final item = exchangeItem[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ItemContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                            color: item.transaction == Transaction.buy
                                ? AppColors.bgGreen
                                : AppColors.bgRed,
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Text(
                          Transaction.values
                              .firstWhere(
                                  (element) => element == item.transaction)
                              .getString(),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(item.currency),
                      const SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                      children: List.generate(
                          exchangeItem[index].priceRange?.length ??
                              exchangeItem[index].calculatedItem.length,
                          (price) => Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Text(
                                        (exchangeItem[index]
                                                    .priceRange?[price] ??
                                                exchangeItem[index]
                                                    .calculatedItem[price]
                                                    .priceRange)!
                                            .getRange(),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Text(
                                        (exchangeItem[index]
                                                    .priceRange?[price] ??
                                                exchangeItem[index]
                                                    .calculatedItem[price]
                                                    .priceRange)!
                                            .getPrice(),
                                      ),
                                    ),
                                  )
                                ],
                              )).toList()),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(child: Center(child: Text(item.getAmountExchange()))),
                const SizedBox(
                  width: 4,
                ),
                Expanded(child: Center(child: Text(item.getTotalPrice())))
              ],
            ),
          ),
        );
      }),
    );
  }
}
