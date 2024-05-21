import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/helpers/number_format.dart';
import 'package:currency_exchange/presentation/calculate/notifier/calculate_notifier.dart';
import 'package:currency_exchange/presentation/calculate/notifier/summary_panel_notifier.dart';
import 'package:currency_exchange/presentation/calculate/widgets/convert_list.dart';
import 'package:currency_exchange/presentation/calculate/widgets/select_country.dart';
import 'package:currency_exchange/presentation/calculate/widgets/select_transaction.dart';
import 'package:currency_exchange/presentation/calculate/widgets/summary_panel.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculateScreen extends ConsumerStatefulWidget {
  const CalculateScreen({super.key});

  @override
  ConsumerState<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends ConsumerState<CalculateScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(calculateNotifier.notifier)
          .setSelectedCurrency(ref.watch(currencyListProvider).currencyList[1]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, child) {
      return !ref.watch(currencyListProvider).isCurrencySet
          ? const Center(child: Text(AppStrings.preventCalculate))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  // const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SelectTransaction(),
                      const SizedBox(
                        height: 48,
                      ),
                      const SelectCountry(),
                      const SizedBox(
                        height: 48,
                      ),
                      const ConvertList(),
                      const SizedBox(
                        height: 40,
                      ),
                      Consumer(
                          builder: (_, ref, __) => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ref
                                                .watch(calculateNotifier)
                                                .totalItemAmount ==
                                            0.0
                                        ? ''
                                        : '${AppStrings.totalAmount} ${CustomNumberFormat.commaFormat(ref.watch(calculateNotifier).totalItemAmount)}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    ref
                                                .watch(calculateNotifier)
                                                .totalItemPrice ==
                                            0.0
                                        ? ''
                                        : '${AppStrings.totalPrice} ${CustomNumberFormat.commaFormat(ref.watch(calculateNotifier).totalItemPrice)}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Consumer(
                              builder: (_, ref, __) => ref
                                      .watch(calculateNotifier.notifier)
                                      .isTransactionBuy
                                  ? CustomButton(
                                      onPressed: () {
                                        ref
                                            .read(calculateNotifier.notifier)
                                            .addSplitItem();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      text: AppStrings.addBill,
                                      bgColor: Colors.orange,
                                    )
                                  : const SizedBox.shrink()),
                          const SizedBox(
                            width: 12,
                          ),
                          Consumer(
                              builder: (context, ref, child) => CustomButton(
                                    onPressed: ref
                                            .watch(calculateNotifier)
                                            .isAddEnable
                                        ? () {
                                            ref
                                                .read(
                                                    calculateNotifier.notifier)
                                                .addToReceipt();
                                            ref
                                                .read(summaryPanelNotifier
                                                    .notifier)
                                                .getSummary();
                                          }
                                        : null,
                                    text: AppStrings.addReceipt,
                                    bgColor:
                                        ref.watch(calculateNotifier).isAddEnable
                                            ? Colors.green
                                            : Colors.grey,
                                  )),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                  // const Spacer(),
                  const SummaryPanel(),
                ],
              ),
            );
    });
  }
}
