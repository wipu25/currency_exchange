import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/presentation/calculate/calculate_controller.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SummaryPanel extends StatelessWidget {
  const SummaryPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculateController>(
      builder: (_, calculateController, __) => calculateController
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
                                                  '${AppStrings.range} ${item.priceRange[index].min ?? 0.0} - ${item.priceRange[index].max ?? '~'}'),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              flexibleText(
                                                  '${AppStrings.price} ${item.priceRange[index].price} X ${AppStrings.amount} ${item.calculatedItem[index].amount}'),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              flexibleText(
                                                  '${AppStrings.range} ${item.priceRange[index].min ?? 0.0} - ${item.priceRange[index].max ?? '~'}'),
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
                  const Text(
                    AppStrings.paymentMethod,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Consumer<CalculateController>(
                      builder: (_, calculateController, __) {
                    return DropdownButton<PaymentMethod>(
                      items: PaymentMethod.values
                          .map((e) => DropdownMenuItem<PaymentMethod>(
                                value: e,
                                child: Text(e.getString()),
                              ))
                          .toList(),
                      onChanged: (PaymentMethod? value) {
                        context
                            .read<CalculateController>()
                            .updatePayment(value);
                      },
                      value: calculateController.payment,
                    );
                  }),
                  CustomButton(
                    onPressed: () => _dialogBuilder(context),
                    bgColor: Colors.lightBlueAccent,
                    text: AppStrings.print,
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
        return AlertDialog(
          title: const Text(AppStrings.print),
          content: const Text(AppStrings.saveComplete),
          actions: <Widget>[
            CustomButton(
              text: AppStrings.print,
              onPressed: () {
                final calculateController =
                    pageContext.read<CalculateController>();
                calculateController.createPdf().then((value) {
                  var snackBar =
                      const SnackBar(content: Text(AppStrings.successPrint));
                  Navigator.of(pageContext).pop();
                  if (!value) {
                    snackBar = const SnackBar(
                      content: Text(AppStrings.alertPrint),
                    );
                    return;
                  }
                  ScaffoldMessenger.of(pageContext).showSnackBar(snackBar);
                  calculateController.save();
                });
              },
              bgColor: Colors.lightGreen,
            ),
            CustomButton(
              text: AppStrings.back,
              onPressed: () {
                Navigator.of(pageContext).pop();
              },
              bgColor: Colors.redAccent,
            ),
          ],
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
