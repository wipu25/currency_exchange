import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/presentation/widgets/country_label.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectCountryDialog extends StatelessWidget {
  final Country? selectedCountry;
  final Function(Country) setSelectedCountry;
  const SelectCountryDialog(
      {Key? key,
      required this.selectedCountry,
      required this.setSelectedCountry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: context
                .watch<CurrencyListService>()
                .currencyList
                .map((item) => GestureDetector(
                      onTap: () => setSelectedCountry.call(item),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: item == selectedCountry
                            ? Colors.lightGreen
                            : Colors.white,
                        child: CountryLabel(
                          logo: item.logo,
                          currency: item.currency,
                          fullCountry: item.countryName,
                        ),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
