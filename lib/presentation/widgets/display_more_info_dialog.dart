import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:currency_exchange/presentation/history/history_item_notifier.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:currency_exchange/presentation/widgets/info_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplayMoreInfoDialog extends ConsumerWidget {
  final TransactionItem transactionItem;
  const DisplayMoreInfoDialog({super.key, required this.transactionItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (_, ref, __) {
      final historyItem = historyItemProvider(transactionItem);
      return AlertDialog(
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
                      ref.read(historyItem.notifier).checkClientInfo(),
                  header: AppStrings.name),
              InfoTextField(
                controller: ref.watch(historyItem.notifier).addressTextField,
                enabled: ref.watch(historyItem).paymentMethod !=
                    PaymentMethod.cancel,
                onChanged: (string) =>
                    ref.read(historyItem.notifier).checkClientInfo(),
                header: AppStrings.address,
              ),
              InfoTextField(
                controller: ref.watch(historyItem.notifier).idTextField,
                enabled: ref.watch(historyItem).paymentMethod !=
                    PaymentMethod.cancel,
                onChanged: (string) =>
                    ref.read(historyItem.notifier).checkClientInfo(),
                header: AppStrings.id,
              )
            ],
          ],
        ),
        actions: <Widget>[
          if (ref.watch(historyItem).paymentMethod != PaymentMethod.cancel) ...[
            if (!ref.watch(historyItem).clientInfo!.isEmpty())
              CustomButton(
                onPressed: () async =>
                    ref.read(historyItem.notifier).printTransaction(),
                text: AppStrings.print,
                bgColor: Colors.blueAccent,
              ),
            const SizedBox(
              width: 8,
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
            ),
          ],
          CustomButton(
            text: AppStrings.back,
            onPressed: () {
              Navigator.of(context).pop();
            },
            bgColor: Colors.blueAccent,
          )
        ],
      );
    });
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

  Widget itemInfo(TransactionItem item) {
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
                          flexibleText(item
                              .calculatedItem[index].transaction.name
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
}
