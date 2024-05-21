import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/presentation/calculate/notifier/summary_panel_notifier.dart';
import 'package:currency_exchange/presentation/calculate/widgets/summary_dialog.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SummaryPanel extends ConsumerWidget {
  const SummaryPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (_, ref, __) => ref
              .watch(summaryPanelNotifier)
              .currencyItem
              .isNotEmpty
          ? SizedBox(
              width: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.totalItem,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  ...List.generate(
                      ref.watch(summaryPanelNotifier).currencyItem.length,
                      (index) {
                    final item =
                        ref.watch(summaryPanelNotifier).currencyItem[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8.0)),
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
                                    padding: const EdgeInsets.all(4.0),
                                    color: item.transaction == Transaction.buy
                                        ? Colors.lightGreen.withOpacity(0.5)
                                        : Colors.red.withOpacity(0.5),
                                    child: Text(
                                      '${item.transaction.name.toUpperCase()} ${item.currency.currency}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
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
                            GestureDetector(
                              onTap: () => ref
                                  .read(summaryPanelNotifier.notifier)
                                  .removeItem(index),
                              child: Container(
                                height: 60,
                                width: 40,
                                color: Colors.red.withOpacity(0.2),
                                child: const Icon(
                                  Icons.delete,
                                  size: 32,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                  if (ref.watch(summaryPanelNotifier).totalBuyPrice > 0.0) ...[
                    const Text(
                      AppStrings.totalBuy,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      "${ref.watch(summaryPanelNotifier.notifier).totalBuyPriceComma} ${AppStrings.thb}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                  if (ref.watch(summaryPanelNotifier).totalSellPrice > 0.0) ...[
                    const Text(
                      AppStrings.totalSell,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      "${ref.watch(summaryPanelNotifier.notifier).totalSellPriceComma} ${AppStrings.thb}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                  const Text(
                    AppStrings.paymentMethod,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  DropdownButton<PaymentMethod>(
                    items: PaymentMethod.values
                        .map((e) => DropdownMenuItem<PaymentMethod>(
                              value: e,
                              child: Text(e.getString()),
                            ))
                        .where(
                            (element) => element.value != PaymentMethod.cancel)
                        .toList(),
                    onChanged: (PaymentMethod? value) {
                      ref.read(summaryPanelNotifier.notifier).setPayment(value);
                    },
                    value: ref.watch(summaryPanelNotifier).payment,
                  ),
                  CustomButton(
                    onPressed: () {
                      ref.read(summaryPanelNotifier.notifier).submit();
                      _dialogBuilder(context);
                    },
                    bgColor: Colors.lightBlueAccent,
                    text: AppStrings.confirm,
                  )
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  Future<void> _dialogBuilder(BuildContext pageContext) {
    return showDialog<void>(
      barrierDismissible: false,
      context: pageContext,
      builder: (BuildContext context) {
        return const SummaryDialog();
      },
    );
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
}
