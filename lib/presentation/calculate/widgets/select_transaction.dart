import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/presentation/calculate/calculate_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectTransaction extends StatelessWidget {
  const SelectTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          AppStrings.transaction,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          width: 8,
        ),
        Consumer<CalculateController>(
            builder: (_, calculateControllers, __) => OutlinedButton(
                onPressed: () => calculateControllers.updateTransaction(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      calculateControllers.transaction.getString(),
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
