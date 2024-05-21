import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/presentation/calculate/notifier/calculate_notifier.dart';
import 'package:currency_exchange/presentation/widgets/select_country_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectCountry extends ConsumerWidget {
  const SelectCountry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (_, ref, __) {
      final selectedCountry = ref.watch(calculateNotifier).selectedCurrency;
      return GestureDetector(
        onTap: () {
          showDialog<void>(
              context: context,
              builder: (BuildContext dialogContext) {
                return Consumer(
                  builder: (_, ref, __) => SelectCountryDialog(
                    selectedCountry:
                        ref.watch(calculateNotifier).selectedCurrency,
                    setSelectedCountry: (country) => ref
                        .read(calculateNotifier.notifier)
                        .setSelectedCurrency(country),
                  ),
                );
              });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                !ref.watch(calculateNotifier.notifier).isTransactionBuy
                    ? currencyIcon('', AppStrings.thb)
                    : currencyIcon(selectedCountry?.logo,
                        selectedCountry?.countryName ?? ''),
                const SizedBox(
                  width: 32,
                ),
                const Icon(
                  Icons.arrow_forward,
                  size: 100,
                ),
                const SizedBox(
                  width: 32,
                ),
                ref.watch(calculateNotifier.notifier).isTransactionBuy
                    ? currencyIcon('', AppStrings.thb)
                    : currencyIcon(selectedCountry?.logo,
                        selectedCountry?.countryName ?? ''),
              ],
            ),
          ],
        ),
      );
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
