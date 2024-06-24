import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/presentation/exchange/widgets/exchange_table.dart';
import 'package:flutter/material.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: AppStrings.exchangeHeader
                .map((item) => Expanded(
                        child: Center(
                      child: Text(
                        item,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.blueAccent),
                      ),
                    )))
                .toList(),
          ),
        ),
        const Expanded(child: ExchangeTable()),
      ],
    );
  }
}
