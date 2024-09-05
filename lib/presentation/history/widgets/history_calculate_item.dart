import 'package:thanarak_exchange/constants/app_colors.dart';
import 'package:thanarak_exchange/helpers/text_style_helper.dart';
import 'package:thanarak_exchange/models/receipt.dart';
import 'package:thanarak_exchange/presentation/exchange/models/exchange_item.dart';
import 'package:thanarak_exchange/presentation/widgets/item_container.dart';
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
                      const SizedBox(
                        width: 8,
                      ),
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
                          style: TextStyleHelper.body1,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        item.currency,
                        style: TextStyleHelper.body1,
                      ),
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
                                        style: TextStyleHelper.body1,
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
                                        style: TextStyleHelper.body1,
                                      ),
                                    ),
                                  )
                                ],
                              )).toList()),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                    child: Center(
                        child: Text(
                  item.transaction == Transaction.buy
                      ? item.getAmountExchange()
                      : item.getTotalPrice(),
                  style: TextStyleHelper.body1,
                ))),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                    child: Center(
                        child: Text(
                  item.transaction == Transaction.buy
                      ? item.getTotalPrice()
                      : item.getAmountExchange(),
                  style: TextStyleHelper.body1,
                )))
              ],
            ),
          ),
        );
      }),
    );
  }
}
