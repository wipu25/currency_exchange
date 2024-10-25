import 'package:thanarak_exchange/constants/app_strings.dart';
import 'package:thanarak_exchange/models/receipt.dart';
import 'package:thanarak_exchange/presentation/calculate/notifier/calculate_notifier.dart';
import 'package:thanarak_exchange/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectTransaction extends StatelessWidget {
  const SelectTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 12,
        ),
        const Text(
          AppStrings.transaction,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          width: 12,
        ),
        Consumer(builder: (_, ref, __) {
          return CustomIconButton(
              onPressed: () =>
                  ref.read(calculateNotifier.notifier).updateTransaction(),
              bgColor:
                  ref.watch(calculateNotifier).transaction == Transaction.buy
                      ? Colors.green
                      : Colors.red,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      ref.watch(calculateNotifier).transaction.getString(),
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(Icons.refresh, color: Colors.white)
                  ],
                ),
              ));
        }),
      ],
    );
  }
}
