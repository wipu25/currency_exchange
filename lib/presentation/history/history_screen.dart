import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/presentation/history/history_controller.dart';
import 'package:currency_exchange/presentation/widgets/custom_table.dart';
import 'package:currency_exchange/presentation/widgets/custom_text_field.dart';
import 'package:currency_exchange/presentation/widgets/header_cell.dart';
import 'package:currency_exchange/presentation/widgets/loading.dart';
import 'package:currency_exchange/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HistoryController>(create: (_) {
      final historyControllers =
          HistoryController(context.read<FirebaseService>());
      historyControllers.init();
      return historyControllers;
    }, builder: (context, snapshot) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(AppStrings.date),
                  const SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    width: 200,
                    child: Consumer<HistoryController>(
                        builder: (_, historyController, child) {
                      final dateTimeDisplay = historyController.dateTimeDisplay;
                      return CustomTextField(
                        value:
                            historyController.formatDateTime(dateTimeDisplay),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: dateTimeDisplay,
                              firstDate: DateTime(2023),
                              lastDate: DateTime.now());
                          if (pickedDate != null) {
                            historyController.selectDateTime(pickedDate);
                          }
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<HistoryController>(builder: (_, historyController, child) {
              return historyController.isLoading
                  ? const Center(child: Loading())
                  : historyController.historyList.isEmpty
                      ? const Center(child: Text(AppStrings.noTransaction))
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                          ),
                          child: CustomTable(
                            column: 9,
                            children: [
                              TableRow(
                                  children: historyController.headerTitle
                                      .map((e) => HeaderCell(
                                            text: e,
                                            fontSize: 18,
                                          ))
                                      .toList()),
                              ...List.generate(
                                  historyController.historyList.length,
                                  (index) {
                                final item =
                                    historyController.historyList[index];
                                return TableRow(children: [
                                  Center(
                                    child: Text(
                                      item.dateTime.split('_')[0],
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      item.dateTime.split('_')[1],
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Column(
                                    children: List.generate(
                                      item.calculatedItem.length,
                                      (index) => flexibleColumn(
                                          item.calculatedItem[index].priceRange
                                              .length,
                                          Transaction.values
                                              .firstWhere((element) =>
                                                  element.name ==
                                                  item.calculatedItem[index]
                                                      .transaction)
                                              .getString(),
                                          index ==
                                              item.calculatedItem.length - 1),
                                    ).toList(),
                                  ),
                                  Column(
                                    children: List.generate(
                                        item.calculatedItem.length,
                                        (index) => flexibleColumn(
                                            item.calculatedItem[index]
                                                .priceRange.length,
                                            item.calculatedItem[index].currency,
                                            index ==
                                                item.calculatedItem.length -
                                                    1)).toList(),
                                  ),
                                  Column(
                                    children: List.generate(
                                        item.calculatedItem.length,
                                        (index) => Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Column(
                                                    children: List.generate(
                                                        item
                                                            .calculatedItem[
                                                                index]
                                                            .priceRange
                                                            .length,
                                                        (price) => Text(
                                                              item
                                                                  .calculatedItem[
                                                                      index]
                                                                  .priceRange[
                                                                      price]
                                                                  .getRange(),
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          12),
                                                            )).toList()),
                                                if (!(index ==
                                                    item.calculatedItem.length -
                                                        1))
                                                  const Divider(
                                                    height: 2,
                                                    color: Colors.black,
                                                  )
                                              ],
                                            )).toList(),
                                  ),
                                  Column(
                                    children: List.generate(
                                        item.calculatedItem.length,
                                        (index) => Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Column(
                                                    children: List.generate(
                                                        item
                                                            .calculatedItem[
                                                                index]
                                                            .priceRange
                                                            .length,
                                                        (price) => Text(
                                                              '${item.calculatedItem[index].priceRange[price].price}',
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          12),
                                                            )).toList()),
                                                if (!(index ==
                                                    item.calculatedItem.length -
                                                        1))
                                                  const Divider(
                                                    height: 2,
                                                    color: Colors.black,
                                                  )
                                              ],
                                            )).toList(),
                                  ),
                                  Column(
                                    children: List.generate(
                                        item.calculatedItem.length,
                                        (index) => flexibleColumn(
                                            item.calculatedItem[index]
                                                .priceRange.length,
                                            item.calculatedItem[index]
                                                .amountExchange
                                                .toString(),
                                            index ==
                                                item.calculatedItem.length -
                                                    1)).toList(),
                                  ),
                                  Column(
                                    children: List.generate(
                                        item.calculatedItem.length,
                                        (index) => flexibleColumn(
                                            item.calculatedItem[index]
                                                .priceRange.length,
                                            item.calculatedItem[index]
                                                .totalPrice
                                                .toString(),
                                            index ==
                                                item.calculatedItem.length -
                                                    1)).toList(),
                                  ),
                                  Center(
                                    child: Text(
                                      item.paymentMethod.name,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ]);
                              }).toList()
                            ],
                          ),
                        );
            }),
          ],
        ),
      );
    });
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
