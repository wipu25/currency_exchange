import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/helpers/number_format.dart';
import 'package:currency_exchange/presentation/calculate/notifier/calculate_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalCalculate extends ConsumerWidget {
  const TotalCalculate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalItemAmount = ref.watch(calculateNotifier).totalItemAmount;
    final totalItemPrice = ref.watch(calculateNotifier).totalItemPrice;
    return (totalItemAmount != 0.0 && totalItemPrice != 0.0)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${AppStrings.totalAmount} ${CustomNumberFormat.commaFormat(totalItemAmount)}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                '${AppStrings.totalPrice} ${CustomNumberFormat.commaFormat(totalItemPrice)}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
