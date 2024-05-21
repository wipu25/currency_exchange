import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/presentation/calculate/notifier/calculate_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectTransaction extends ConsumerWidget {
  const SelectTransaction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Text(
          AppStrings.transaction,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          width: 8,
        ),
        Consumer(
            builder: (_, ref, __) => OutlinedButton(
                onPressed: () =>
                    ref.read(calculateNotifier.notifier).updateTransaction(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      ref.watch(calculateNotifier).transaction.getString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(Icons.refresh)
                  ],
                ))),
      ],
    );
  }
}
