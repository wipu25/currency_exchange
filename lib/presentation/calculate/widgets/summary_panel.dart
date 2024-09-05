import 'package:thanarak_exchange/constants/app_strings.dart';
import 'package:thanarak_exchange/models/receipt.dart';
import 'package:thanarak_exchange/presentation/calculate/notifier/summary_dialog_notifier.dart';
import 'package:thanarak_exchange/presentation/calculate/notifier/summary_panel_notifier.dart';
import 'package:thanarak_exchange/presentation/calculate/widgets/summary_dialog.dart';
import 'package:thanarak_exchange/presentation/calculate/widgets/summary_item.dart';
import 'package:thanarak_exchange/presentation/widgets/custom_button.dart';
import 'package:thanarak_exchange/presentation/widgets/item_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SummaryPanel extends ConsumerWidget {
  const SummaryPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(summaryPanelNotifier).currencyItem.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(4.0),
            child: ItemContainer(
              padding: const EdgeInsets.all(12.0),
              width: 280,
              child: Column(
                children: [
                  const Text(
                    AppStrings.totalItem,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SummaryItem(
                              itemList:
                                  ref.watch(summaryPanelNotifier).currencyItem),
                          if (ref.watch(summaryPanelNotifier).totalBuyPrice >
                              0.0) ...[
                            const Text(
                              AppStrings.totalBuy,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Text(
                              "${ref.watch(summaryPanelNotifier.notifier).totalBuyPriceComma} ${AppStrings.thb}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                          if (ref.watch(summaryPanelNotifier).totalSellPrice >
                              0.0) ...[
                            const Text(
                              AppStrings.totalSell,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Text(
                              "${ref.watch(summaryPanelNotifier.notifier).totalSellPriceComma} ${AppStrings.thb}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                          const Text(
                            AppStrings.paymentMethod,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          DropdownButton<PaymentMethod>(
                            items: PaymentMethod.values
                                .map((e) => DropdownMenuItem<PaymentMethod>(
                                      value: e,
                                      child: Text(e.getString()),
                                    ))
                                .where((element) =>
                                    element.value != PaymentMethod.cancel)
                                .toList(),
                            onChanged: (PaymentMethod? value) {
                              ref
                                  .read(summaryPanelNotifier.notifier)
                                  .setPayment(value);
                            },
                            value: ref.watch(summaryPanelNotifier).payment,
                          ),
                          CustomButton(
                            onPressed: () {
                              ref.read(summaryPanelNotifier.notifier).submit();
                              ref
                                  .read(summaryDialogStateProvider.notifier)
                                  .setClientInfo();
                              _dialogBuilder(context);
                            },
                            bgColor: Colors.lightBlueAccent,
                            text: AppStrings.confirm,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
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
}
