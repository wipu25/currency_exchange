import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:currency_exchange/presentation/history/widgets/history_calculate_item.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:currency_exchange/presentation/widgets/item_container.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  final TransactionItem item;
  final Function()? onPressed;
  const HistoryItem({super.key, required this.item, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ItemContainer(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                item.dateTime.split('_')[0].replaceAll('-', '/'),
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                item.dateTime.split('_')[1],
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
          Expanded(
              flex: 8,
              child: HistoryCalculateItem(calculatedItem: item.calculatedItem)),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                item.paymentMethod.getString(),
                style: TextStyle(
                    fontSize: 12,
                    color: item.paymentMethod == PaymentMethod.cancel
                        ? Colors.red
                        : Colors.black),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: CustomButton(
                padding: const EdgeInsets.all(0.0),
                onPressed: onPressed,
                text: AppStrings.moreInfo,
                bgColor: Colors.blueAccent,
                fontSize: 12,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget flexibleColumn(int length, String text, bool isLast) {
    return SizedBox(
      height: length * 24,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                text,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
          if (!isLast)
            const Divider(
              height: 1,
              color: Colors.black,
            )
        ],
      ),
    );
  }
}