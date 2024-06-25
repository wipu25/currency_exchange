import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/presentation/calculate/notifier/calculate_notifier.dart';
import 'package:currency_exchange/presentation/calculate/notifier/summary_panel_notifier.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculateBtnRow extends ConsumerWidget {
  const CalculateBtnRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculateFunc = ref.read(calculateNotifier.notifier);
    final calculateState = ref.watch(calculateNotifier);
    final summaryFunc = ref.watch(summaryPanelNotifier.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer(
            builder: (_, ref, __) =>
                calculateState.transaction == Transaction.buy
                    ? CustomButton(
                        onPressed: () {
                          calculateFunc.addSplitItem();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        text: AppStrings.addBill,
                        bgColor: Colors.orange,
                      )
                    : const SizedBox.shrink()),
        const SizedBox(
          width: 12,
        ),
        Consumer(
            builder: (_, ref, __) => CustomButton(
                  onPressed: calculateState.isAddEnable
                      ? () {
                          calculateFunc.addToReceipt();
                          summaryFunc.getSummary();
                        }
                      : null,
                  text: AppStrings.addReceipt,
                  bgColor:
                      calculateState.isAddEnable ? Colors.green : Colors.grey,
                )),
      ],
    );
  }
}
