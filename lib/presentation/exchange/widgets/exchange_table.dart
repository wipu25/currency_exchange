import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/presentation/calculate/models/exchange_screen_state.dart';
import 'package:currency_exchange/presentation/exchange/exchange_notifier.dart';
import 'package:currency_exchange/presentation/exchange/widgets/exchange_item.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:currency_exchange/presentation/widgets/loading.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExchangeTable extends ConsumerWidget {
  const ExchangeTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCurrency = ref.watch(exchangeNotifier);
    final exchangeFunction = ref.read(exchangeNotifier.notifier);
    final currencyState = ref.watch(currencyListProvider);
    return switch (asyncCurrency) {
      AsyncData(:final value) => ListView(children: [
          ...List.generate(
              currencyState.currencyList.length,
              (index) => ExchangeItem(
                    onPriceChange: (rate, value, type) => ref
                        .read(exchangeNotifier.notifier)
                        .addRate(index, rate, value, type),
                    item: currencyState.currencyList[index],
                    buyCurrencyItem: currencyState.buyCurrencyList[index],
                    sellCurrencyItem: currencyState.sellCurrencyList[index],
                    state: value,
                  )),
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CustomButton(
              onPressed: value != ExchangeState.disable
                  ? () {
                      if (value == ExchangeState.save) {
                        exchangeFunction.onSave();
                        return;
                      }
                      exchangeFunction.onEdit();
                    }
                  : null,
              text: value == ExchangeState.save
                  ? AppStrings.save
                  : AppStrings.edit,
              bgColor: getBtnBgColor(value),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ]),
      AsyncError(:final error) => const Text(AppStrings.errorNetwork),
      _ => const Loading(),
    };
  }

  Color getBtnBgColor(ExchangeState value) {
    switch (value) {
      case ExchangeState.disable:
        return Colors.grey;
      default:
        return Colors.lightBlueAccent;
    }
  }
}
