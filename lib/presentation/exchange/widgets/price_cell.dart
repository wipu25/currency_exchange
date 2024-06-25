import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/helpers/number_format.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/presentation/calculate/models/exchange_screen_state.dart';
import 'package:currency_exchange/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class PriceCell extends StatelessWidget {
  final String? value;
  final ExchangeState state;
  final Color bgColor;
  final Function(String) onChange;
  const PriceCell({
    super.key,
    this.value,
    required this.onChange,
    required this.state,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.all(4.0),
      child: state == ExchangeState.edit
          ? Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                CustomNumberFormat.fieldDoubleFormat(value ?? '0.0'),
                style: const TextStyle(fontSize: 20),
              ),
            )
          : CustomTextField(
              value: CustomNumberFormat.fieldDoubleFormat(value),
              onChanged: (value) {
                try {
                  onChange.call(value);
                  ScaffoldMessenger.of(context).clearSnackBars();
                } catch (e) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(e is CalculateException
                        ? e.message
                        : AppStrings.notNumberAlert),
                    duration: const Duration(seconds: 3),
                  ));
                }
              },
            ),
    );
  }
}
