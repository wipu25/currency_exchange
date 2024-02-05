import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/presentation/calculate/calculate_controller.dart';
import 'package:currency_exchange/presentation/calculate/widgets/convert_list.dart';
import 'package:currency_exchange/presentation/calculate/widgets/select_country.dart';
import 'package:currency_exchange/presentation/calculate/widgets/select_transaction.dart';
import 'package:currency_exchange/presentation/calculate/widgets/summary_panel.dart';
import 'package:currency_exchange/presentation/exchange/exchange_controller.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:currency_exchange/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculateScreen extends StatelessWidget {
  const CalculateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) {
      final firebaseService = context.read<FirebaseService>();
      final calculateControllers = CalculateController(firebaseService);
      calculateControllers
          .init(context.read<CurrencyListService>().currencyList[1]);
      return calculateControllers;
    }, builder: (context, child) {
      return Consumer<ExchangeController>(
          builder: (_, exchangeController, child) {
        return !exchangeController.isCurrencySet
            ? const Center(child: Text(AppStrings.preventCalculate))
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SelectTransaction(),
                          const SizedBox(
                            height: 48,
                          ),
                          const SelectCountry(),
                          const SizedBox(
                            height: 48,
                          ),
                          const ConvertList(),
                          const SizedBox(
                            height: 40,
                          ),
                          Consumer<CalculateController>(
                              builder: (_, calculateControllers, __) => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        calculateControllers.totalItemAmount ==
                                                0.0
                                            ? ''
                                            : '${AppStrings.totalAmount} ${calculateControllers.totalItemAmount}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        calculateControllers.totalItemPrice ==
                                                0.0
                                            ? ''
                                            : '${AppStrings.totalPrice} ${calculateControllers.totalItemPrice}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Consumer<CalculateController>(
                                  builder: (_, calculateControllers, __) =>
                                      calculateControllers.isTransactionBuy &&
                                              calculateControllers
                                                      .selectedCountry!
                                                      .buyPriceRange
                                                      .length >
                                                  1
                                          ? CustomButton(
                                              onPressed: () {
                                                calculateControllers
                                                    .addSplitItem();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              text: AppStrings.addBill,
                                              bgColor: Colors.orange,
                                            )
                                          : const SizedBox.shrink()),
                              const SizedBox(
                                width: 12,
                              ),
                              Consumer<CalculateController>(
                                  builder:
                                      (context, calculateControllers, child) =>
                                          CustomButton(
                                            onPressed:
                                                calculateControllers.isAddEnable
                                                    ? () => calculateControllers
                                                        .addToReceipt()
                                                    : null,
                                            text: AppStrings.addReceipt,
                                            bgColor:
                                                calculateControllers.isAddEnable
                                                    ? Colors.green
                                                    : Colors.grey,
                                          )),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                    const SummaryPanel(),
                  ],
                ),
              );
      });
    });
  }
}
