import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/presentation/calculate/calculate_controller.dart';
import 'package:currency_exchange/presentation/widgets/select_country_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectCountry extends StatelessWidget {
  const SelectCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculateController>(
        builder: (consumerContext, calculateControllers, __) {
      final selectedCountry = calculateControllers.selectedCountry;
      return GestureDetector(
        onTap: () {
          showDialog<void>(
              context: consumerContext,
              builder: (BuildContext dialogContext) {
                return ChangeNotifierProvider.value(
                  value: consumerContext.read<CalculateController>(),
                  child: Consumer<CalculateController>(
                    builder: (_, calculateControllers, __) =>
                        SelectCountryDialog(
                      selectedCountry: calculateControllers.selectedCountry,
                      setSelectedCountry: (country) =>
                          calculateControllers.setSelectedCurrency(country),
                    ),
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
                !calculateControllers.isTransactionBuy
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
                calculateControllers.isTransactionBuy
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
