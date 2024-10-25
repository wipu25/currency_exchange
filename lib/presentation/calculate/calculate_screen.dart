import 'package:thanarak_exchange/constants/app_strings.dart';
import 'package:thanarak_exchange/presentation/calculate/notifier/calculate_notifier.dart';
import 'package:thanarak_exchange/presentation/calculate/widgets/calculate_btn_row.dart';
import 'package:thanarak_exchange/presentation/calculate/widgets/convert_list.dart';
import 'package:thanarak_exchange/presentation/calculate/widgets/select_country.dart';
import 'package:thanarak_exchange/presentation/calculate/widgets/select_transaction.dart';
import 'package:thanarak_exchange/presentation/calculate/widgets/summary_panel.dart';
import 'package:thanarak_exchange/presentation/calculate/widgets/total_calculate.dart';
import 'package:thanarak_exchange/services/currency_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculateScreen extends ConsumerStatefulWidget {
  const CalculateScreen({super.key});

  @override
  ConsumerState<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends ConsumerState<CalculateScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(calculateNotifier.notifier)
          .setSelectedCurrency(ref.watch(currencyListProvider).currencyList[1]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !ref.watch(currencyListProvider).isCurrencySet
        ? const Center(child: Text(AppStrings.preventCalculate))
        : const _CalculateScreenBody();
  }
}

class _CalculateScreenBody extends StatelessWidget {
  const _CalculateScreenBody();
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectTransaction(),
              SelectCountry(),
              Expanded(child: ConvertList()),
              SizedBox(
                height: 24,
              ),
              TotalCalculate(),
              SizedBox(
                height: 8,
              ),
              CalculateBtnRow(),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        SummaryPanel(),
      ],
    );
  }
}
