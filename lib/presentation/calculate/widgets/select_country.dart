import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/presentation/calculate/notifier/calculate_notifier.dart';
import 'package:currency_exchange/presentation/widgets/select_country_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectCountry extends StatelessWidget {
  const SelectCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext) {
              return const SelectCountryDialog();
            });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          checkCurrencyIcon(Transaction.buy),
          const SizedBox(
            width: 32,
          ),
          Consumer(
            builder: (_, ref, __) {
              final transaction = ref.watch(calculateNotifier).transaction;
              return Icon(
                Icons.arrow_forward,
                size: 100,
                color:
                    transaction == Transaction.buy ? Colors.green : Colors.red,
              );
            },
          ),
          const SizedBox(
            width: 32,
          ),
          checkCurrencyIcon(Transaction.sell),
        ],
      ),
    );
  }

  Widget checkCurrencyIcon(Transaction transaction) {
    return Consumer(builder: (_, ref, __) {
      final calculateState = ref.watch(calculateNotifier);
      return calculateState.transaction == transaction
          ? currencyIcon('', AppStrings.thb)
          : currencyIcon(calculateState.selectedCurrency?.logo,
              calculateState.selectedCurrency?.countryName ?? '');
    });
  }

  Widget currencyIcon(String? image, String country) {
    return Column(
      children: [
        image == null || image.isEmpty
            ? const Icon(
                Icons.currency_exchange,
                size: 100,
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  image,
                  width: 100,
                  height: 100,
                )),
        const SizedBox(
          height: 16,
        ),
        Text(
          country,
          style: const TextStyle(fontSize: 32),
        )
      ],
    );
  }
}
