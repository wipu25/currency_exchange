import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/presentation/history/history_controller.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:currency_exchange/presentation/widgets/custom_table.dart';
import 'package:currency_exchange/presentation/widgets/custom_text_field.dart';
import 'package:currency_exchange/presentation/widgets/display_more_info_dialog.dart';
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
            Consumer<HistoryController>(
                builder: (consumerContext, historyController, child) {
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
                            customColumn: const <int, FlexColumnWidth>{
                              0: FlexColumnWidth(1.15),
                              2: FlexColumnWidth(0.5),
                              3: FlexColumnWidth(0.9),
                              4: FlexColumnWidth(1.3),
                              8: FlexColumnWidth(0.75),
                              9: FlexColumnWidth(0.75),
                              10: FlexColumnWidth(0.75)
                            },
                            column: 11,
                            children: [
                              TableRow(
                                  children: historyController.headerTitle
                                      .map((e) => HeaderCell(
                                            text: e,
                                            fontSize: 16,
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
                                                              item
                                                                  .calculatedItem[
                                                                      index]
                                                                  .priceRange[
                                                                      price]
                                                                  .getPrice(),
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
                                                .getAmountExchange(),
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
                                                .getTotalPrice(),
                                            index ==
                                                item.calculatedItem.length -
                                                    1)).toList(),
                                  ),
                                  Center(
                                    child: Text(
                                      item.paymentMethod.getString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: item.paymentMethod ==
                                                  PaymentMethod.cancel
                                              ? Colors.red
                                              : Colors.black),
                                    ),
                                  ),
                                  Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: CustomButton(
                                      onPressed: () =>
                                          _dialogBuilder(context, index),
                                      text: AppStrings.moreInfo,
                                      bgColor: Colors.blueAccent,
                                      fontSize: 8,
                                    ),
                                  )),
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

  Future<void> _dialogBuilder(BuildContext pageContext, int index) {
    return showDialog<void>(
      barrierDismissible: false,
      context: pageContext,
      builder: (BuildContext context) {
        return ChangeNotifierProvider.value(
          value: pageContext.read<HistoryController>(),
          child:
              Consumer<HistoryController>(builder: (_, historyController, __) {
            return AlertDialog(
              scrollable: true,
              title: const Center(
                  child: Text(
                AppStrings.moreInfo,
                style: TextStyle(fontSize: 32),
              )),
              content: historyController.isCancel
                  ? const Column(
                      children: [
                        Text(AppStrings.cancelling),
                        Loading(),
                      ],
                    )
                  : DisplayMoreInfoDialog(
                      item: historyController.historyList[index],
                    ),
              actions: <Widget>[
                Row(
                  children: [
                    if (historyController.historyList[index].paymentMethod !=
                        PaymentMethod.cancel) ...[
                      CustomButton(
                        onPressed: () async =>
                            historyController.printTransaction(index),
                        text: AppStrings.print,
                        bgColor: Colors.blueAccent,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomButton(
                        text: AppStrings.cancel,
                        onPressed: () async {
                          await historyController
                              .cancelTransaction(index)
                              .then((value) {
                            Navigator.of(pageContext).pop();
                          });
                        },
                        bgColor: Colors.red,
                      ),
                    ],
                    const Spacer(),
                    CustomButton(
                      text: AppStrings.back,
                      onPressed: () {
                        Navigator.of(pageContext).pop();
                      },
                      bgColor: Colors.blueAccent,
                    ),
                  ],
                )
              ],
            );
          }),
        );
      },
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
