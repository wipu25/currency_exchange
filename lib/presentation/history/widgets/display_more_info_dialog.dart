import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:currency_exchange/presentation/history/history_item_notifier.dart';
import 'package:currency_exchange/presentation/history/history_notifier.dart';
import 'package:currency_exchange/presentation/history/widgets/history_calculate_item.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:currency_exchange/presentation/widgets/info_text_field.dart';
import 'package:currency_exchange/presentation/widgets/item_container.dart';
import 'package:currency_exchange/presentation/widgets/nth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplayMoreInfoDialog extends ConsumerWidget {
  final int index;
  const DisplayMoreInfoDialog({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyItem =
        historyItemProvider(ref.read(historyNotifier).historyList[index]);
    return AlertDialog(
      surfaceTintColor: Colors.white,
      scrollable: true,
      title: const Center(
          child: Text(
        AppStrings.moreInfo,
        style: TextStyle(fontSize: 32),
      )),
      content: Column(
        children: [
          itemInfo(ref.watch(historyItem)),
          if (ref.watch(historyItem).clientInfo != null) ...[
            InfoTextField(
                controller: ref.watch(historyItem.notifier).nameTextField,
                enabled: ref.watch(historyItem).paymentMethod !=
                    PaymentMethod.cancel,
                onChanged: (string) =>
                    ref.read(historyItem.notifier).updateClientInfo(),
                header: AppStrings.name),
            InfoTextField(
              controller: ref.watch(historyItem.notifier).addressTextField,
              enabled:
                  ref.watch(historyItem).paymentMethod != PaymentMethod.cancel,
              onChanged: (string) =>
                  ref.read(historyItem.notifier).updateClientInfo(),
              header: AppStrings.address,
            ),
            InfoTextField(
              controller: ref.watch(historyItem.notifier).idTextField,
              enabled:
                  ref.watch(historyItem).paymentMethod != PaymentMethod.cancel,
              onChanged: (string) =>
                  ref.read(historyItem.notifier).updateClientInfo(),
              header: AppStrings.id,
            )
          ],
        ],
      ),
      actions: <Widget>[
        ...(ref.watch(historyItem.notifier).isClientInfoComplete &&
                ref.watch(historyItem).paymentMethod != PaymentMethod.cancel
            ? <Widget>[
                CustomButton(
                  onPressed: () async {
                    ref
                        .read(historyItem.notifier)
                        .printTransaction()
                        .then((value) => Navigator.of(context).pop());
                  },
                  text: AppStrings.print,
                  bgColor: Colors.green,
                ),
                CustomButton(
                  text: AppStrings.cancel,
                  onPressed: () async {
                    await ref
                        .read(historyItem.notifier)
                        .cancelTransaction()
                        .then((value) {
                      Navigator.of(context).pop(ref.read(historyItem));
                    });
                  },
                  bgColor: Colors.red,
                )
              ]
            : <Widget>[const Nth()]),
        CustomButton(
          text: AppStrings.back,
          onPressed: () {
            Navigator.of(context).pop();
          },
          bgColor: Colors.blueAccent,
        )
      ],
    );
  }

  Widget flexibleText(String text, {int? flex}) {
    return Expanded(
        flex: flex ?? 1,
        child: Center(
          child: Text(
            text.toString(),
            style: const TextStyle(fontSize: 16),
          ),
        ));
  }

  Widget itemInfo(TransactionItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ItemContainer(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Text(
                '${AppStrings.date} ${item.dateTime.split('_')[0]}',
                style: const TextStyle(fontSize: 24),
              ),
              const Spacer(),
              Text(
                '${AppStrings.time} ${item.dateTime.split('_')[1]}',
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ItemContainer(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text(
                AppStrings.totalItem,
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  flexibleText(AppStrings.transaction),
                  flexibleText(AppStrings.range, flex: 2),
                  flexibleText(AppStrings.price),
                  flexibleText(AppStrings.amount),
                  flexibleText(AppStrings.totalPrice),
                ],
              ),
              HistoryCalculateItem(exchangeItem: item.calculatedItem),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ItemContainer(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
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
                  '${item.paymentMethod == PaymentMethod.cancel ? '' : AppStrings.paymentMethod} ${item.paymentMethod.getString()}',
                  style: TextStyle(
                      fontSize: 24,
                      color: item.paymentMethod == PaymentMethod.cancel
                          ? Colors.redAccent
                          : Colors.black),
                ),
              ],
            ))
      ],
    );
  }
}
