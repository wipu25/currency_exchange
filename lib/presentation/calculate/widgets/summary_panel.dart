import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/presentation/calculate/calculate_controller.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:currency_exchange/presentation/widgets/display_transaction_dialog.dart';
import 'package:currency_exchange/presentation/widgets/info_text_field.dart';
import 'package:currency_exchange/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SummaryPanel extends StatelessWidget {
  const SummaryPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculateController>(
      builder: (consumerContext, calculateController, __) => calculateController
              .currencyItem.isNotEmpty
          ? SizedBox(
              width: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.totalItem,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  ...List.generate(calculateController.currencyItem.length,
                      (index) {
                    final item = calculateController.currencyItem[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(4.0),
                                    color: item.transaction == 'buy'
                                        ? Colors.lightGreen.withOpacity(0.5)
                                        : Colors.red.withOpacity(0.5),
                                    child: Text(
                                      '${item.transaction.toUpperCase()} ${item.currency}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ...List.generate(
                                      item.priceRange.length,
                                      (index) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              flexibleText(
                                                  '${AppStrings.range} ${item.priceRange[index].getRange()}'),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              flexibleText(
                                                  '${AppStrings.price} ${item.priceRange[index].getPrice()} X ${item.calculatedItem[index].getAmount()}'),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              flexibleText(
                                                  '= ${item.calculatedItem[index].getPrice()}'),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                            ],
                                          )).toList(),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  calculateController.removeCurrencyItem(index),
                              child: Container(
                                height: 60,
                                width: 40,
                                color: Colors.red.withOpacity(0.2),
                                child: const Icon(
                                  Icons.delete,
                                  size: 32,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                  if (calculateController.totalBuyPrice > 0.0) ...[
                    const Text(
                      AppStrings.totalBuy,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      "${calculateController.totalBuyPriceComma} ${AppStrings.thb}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                  if (calculateController.totalSellPrice > 0.0) ...[
                    const Text(
                      AppStrings.totalSell,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      "${calculateController.totalSellPriceComma} ${AppStrings.thb}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                  const Text(
                    AppStrings.paymentMethod,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  DropdownButton<PaymentMethod>(
                    items: PaymentMethod.values
                        .map((e) => DropdownMenuItem<PaymentMethod>(
                              value: e,
                              child: Text(e.getString()),
                            ))
                        .where(
                            (element) => element.value != PaymentMethod.cancel)
                        .toList(),
                    onChanged: (PaymentMethod? value) {
                      context.read<CalculateController>().updatePayment(value);
                    },
                    value: calculateController.payment,
                  ),
                  CustomButton(
                    onPressed: () {
                      calculateController.setCurrentTransaction();
                      _dialogBuilder(consumerContext);
                    },
                    bgColor: Colors.lightBlueAccent,
                    text: AppStrings.confirm,
                  )
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  Future<void> _dialogBuilder(BuildContext pageContext) {
    return showDialog<void>(
      barrierDismissible: false,
      context: pageContext,
      builder: (BuildContext context) {
        return ChangeNotifierProvider.value(
          value: pageContext.read<CalculateController>(),
          child: Consumer<CalculateController>(
              builder: (_, calculateController, __) {
            return AlertDialog(
              scrollable: true,
              title: const Text(AppStrings.print),
              content: calculateController.billOperation != BillOperation.none
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          calculateController.billOperation.getString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Loading(),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (calculateController.isContainSell)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      color: Colors.blueAccent, width: 1)),
                              padding: const EdgeInsets.all(8.0),
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InfoTextField(
                                    header: AppStrings.name,
                                    controller:
                                        calculateController.nameTextField,
                                    onChanged: (string) =>
                                        calculateController.checkClientInfo(),
                                    hintText: AppStrings.hintName,
                                  ),
                                  InfoTextField(
                                    header: AppStrings.id,
                                    controller: calculateController.idTextField,
                                    onChanged: (string) =>
                                        calculateController.checkClientInfo(),
                                    hintText: AppStrings.hintID,
                                  ),
                                  InfoTextField(
                                    header: AppStrings.address,
                                    controller:
                                        calculateController.addressTextField,
                                    onChanged: (string) =>
                                        calculateController.checkClientInfo(),
                                    hintText: AppStrings.hintAddress,
                                    maxLines: 3,
                                  )
                                ],
                              ),
                            ),
                          ),
                        DisplayTransactionDialog(
                            currentTransaction:
                                calculateController.currentTransaction),
                      ],
                    ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (calculateController.isClientInfoComplete ||
                        !calculateController.isContainSell) ...[
                      CustomButton(
                        text: AppStrings.print,
                        onPressed: () {
                          try {
                            calculateController.saveClientInfo();
                            calculateController.createPdf().then((value) {
                              var snackBar = const SnackBar(
                                  content: Text(AppStrings.successPrint));
                              Navigator.of(pageContext).pop();
                              if (!value) {
                                snackBar = const SnackBar(
                                  content: Text(AppStrings.alertPrint),
                                );
                                return;
                              }
                              ScaffoldMessenger.of(pageContext)
                                  .showSnackBar(snackBar);
                              calculateController.save();
                            });
                          } catch (e) {
                            final snackBar =
                                SnackBar(content: Text(e.toString()));
                            ScaffoldMessenger.of(pageContext)
                                .showSnackBar(snackBar);
                          }
                        },
                        bgColor: Colors.lightGreen,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomButton(
                        text: AppStrings.save,
                        onPressed: () async {
                          calculateController.saveClientInfo();
                          await calculateController
                              .save()
                              .then((value) => Navigator.of(pageContext).pop());
                        },
                        bgColor: Colors.blueAccent,
                      ),
                    ],
                    const SizedBox(
                      width: 8,
                    ),
                    CustomButton(
                      text: AppStrings.back,
                      onPressed: () {
                        Navigator.of(pageContext).pop();
                      },
                      bgColor: Colors.redAccent,
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

  Widget flexibleText(String text) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
