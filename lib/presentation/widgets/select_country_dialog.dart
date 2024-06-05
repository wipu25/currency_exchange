import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/presentation/calculate/notifier/calculate_notifier.dart';
import 'package:currency_exchange/presentation/widgets/country_label.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectCountryDialog extends ConsumerWidget {
  const SelectCountryDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: ref.watch(currencyListProvider).currencyList.map((item) {
              final selectedCurrency =
                  ref.watch(calculateNotifier).selectedCurrency;
              return GestureDetector(
                onTap: () => ref
                    .read(calculateNotifier.notifier)
                    .setSelectedCurrency(item),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: item == selectedCurrency
                          ? Colors.blueAccent
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16.0)),
                  child: CountryLabel(
                    logo: item.logo,
                    currency: item.currency,
                    fullCountry: item.countryName,
                    textColor:
                        item == selectedCurrency ? Colors.white : Colors.black,
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }
}
