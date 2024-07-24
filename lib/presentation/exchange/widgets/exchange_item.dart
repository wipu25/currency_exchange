import 'package:currency_exchange/constants/app_colors.dart';
import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/presentation/calculate/models/exchange_screen_state.dart';
import 'package:currency_exchange/presentation/exchange/widgets/price_cell.dart';
import 'package:currency_exchange/presentation/widgets/country_label.dart';
import 'package:currency_exchange/presentation/widgets/item_container.dart';
import 'package:flutter/material.dart';

class ExchangeItem extends StatelessWidget {
  final Country item;
  final List<String?> buyCurrencyItem;
  final List<String?> sellCurrencyItem;
  final ExchangeState state;
  final Function(int, String, PriceType) onPriceChange;
  const ExchangeItem(
      {required this.state,
      required this.item,
      required this.buyCurrencyItem,
      required this.sellCurrencyItem,
      required this.onPriceChange,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 1,
                  offset: const Offset(2, 2),
                  color: Colors.black.withOpacity(0.2))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: CountryLabel(
                    logo: item.logo,
                    currency: item.currency,
                    fullCountry: item.countryName,
                  ),
                )),
            Expanded(
              flex: 5,
              child: Column(
                children: List.generate(
                    item.buyPriceRange.length,
                    (buyItem) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ItemContainer(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    item.buyPriceRange[buyItem].getRange(),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                )),
                                Expanded(
                                  child: PriceCell(
                                    bgColor: AppColors.bgRed,
                                    value: buyCurrencyItem[buyItem],
                                    state: state,
                                    onChange: (value) => onPriceChange(
                                        buyItem, value, PriceType.buy),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ItemContainer(
                  padding: const EdgeInsets.all(8.0),
                  child: PriceCell(
                    bgColor: AppColors.bgGreen,
                    value: sellCurrencyItem[0],
                    state: state,
                    onChange: (value) =>
                        onPriceChange(0, value, PriceType.sell),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
