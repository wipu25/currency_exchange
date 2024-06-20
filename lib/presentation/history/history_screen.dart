import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/helpers/date_time_format.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:currency_exchange/presentation/history/history_notifier.dart';
import 'package:currency_exchange/presentation/history/widgets/filter.dart';
import 'package:currency_exchange/presentation/history/widgets/history_item.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:currency_exchange/presentation/widgets/custom_table.dart';
import 'package:currency_exchange/presentation/widgets/custom_text_field.dart';
import 'package:currency_exchange/presentation/history/widgets/display_more_info_dialog.dart';
import 'package:currency_exchange/presentation/history/widgets/header_cell.dart';
import 'package:currency_exchange/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});
  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(historyNotifier.notifier).init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(builder: (_, ref, __) {
                  final dateTimeDisplay =
                      ref.watch(historyNotifier).dateTimeDisplay;
                  return CustomButton(
                    text:
                        "${AppStrings.date} ${DateTimeFormat.formatDateTime(dateTimeDisplay)}",
                    bgColor: Colors.blueAccent,
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: dateTimeDisplay,
                          firstDate: DateTime(2023),
                          lastDate: DateTime.now());
                      if (pickedDate != null) {
                        ref
                            .read(historyNotifier.notifier)
                            .selectDateTime(pickedDate);
                      }
                    },
                  );
                }),
                const Spacer(),
                CustomButton(
                  padding: const EdgeInsets.all(4.0),
                  text: AppStrings.filter,
                  bgColor: Colors.blueAccent,
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext dialogContext) =>
                            const Filter());
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Consumer(builder: (_, ref, child) {
              final historyService = ref.watch(historyNotifier);
              final headerTitle =
                  ref.watch(historyNotifier.notifier).headerTitle;
              return historyService.isLoading
                  ? const Center(child: Loading())
                  : historyService.historyList.isEmpty
                      ? const Center(child: Text(AppStrings.noTransaction))
                      : Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                    headerTitle.length,
                                    (index) => Expanded(
                                          flex: _isFlexible(index),
                                          child: HeaderCell(
                                            text: headerTitle[index],
                                            fontSize: 12,
                                          ),
                                        )).toList(),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: historyService.historyList.length,
                                itemBuilder: (context, index) => HistoryItem(
                                    item: historyService.historyList[index],
                                    onPressed: () =>
                                        _dialogBuilder(context, index)),
                              ),
                            )
                          ],
                        );
            }),
          ),
        ],
      ),
    );
  }

  int _isFlexible(int index) {
    switch (index) {
      case 3:
        return 4;
      case 5:
      case 4:
      case 2:
      case 6:
      case 7:
      case 1:
        return 2;
      default:
        return 1;
    }
  }

  Future<void> _dialogBuilder(BuildContext pageContext, int index) async {
    final result = await showDialog<TransactionItem>(
      barrierDismissible: false,
      context: pageContext,
      builder: (BuildContext context) {
        return DisplayMoreInfoDialog(
            transactionItem: ref.read(historyNotifier).historyList[index]);
      },
    );
    if (result != null) {
      ref.read(historyNotifier.notifier).updateTransaction(result, index);
    }
  }
}
