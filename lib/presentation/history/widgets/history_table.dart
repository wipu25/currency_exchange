import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:currency_exchange/presentation/history/history_notifier.dart';
import 'package:currency_exchange/presentation/history/widgets/display_more_info_dialog.dart';
import 'package:currency_exchange/presentation/history/widgets/header_cell.dart';
import 'package:currency_exchange/presentation/history/widgets/history_item.dart';
import 'package:currency_exchange/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryTable extends StatelessWidget {
  const HistoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [HistoryTitle(), Expanded(child: HistoryBody())],
    );
  }
}

class HistoryBody extends ConsumerWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyService = ref.watch(historyNotifier);
    return historyService.isLoading
        ? const Center(child: Loading())
        : historyService.historyList.isEmpty
            ? const Center(child: Text(AppStrings.noTransaction))
            : ListView.builder(
                itemCount: historyService.historyList.length,
                itemBuilder: (context, index) => HistoryItem(
                    item: historyService.historyList[index],
                    onPressed: () => _dialogBuilder(
                        context,
                        index,
                        (item) => ref
                            .read(historyNotifier.notifier)
                            .updateTransaction(item, index))),
              );
  }

  Future<void> _dialogBuilder(BuildContext pageContext, int index,
      Function(TransactionItem item) onUpdate) async {
    final result = await showDialog<TransactionItem>(
      barrierDismissible: false,
      context: pageContext,
      builder: (BuildContext context) {
        return DisplayMoreInfoDialog(index: index);
      },
    );
    if (result != null) {
      onUpdate.call(result);
    }
  }
}

class HistoryTitle extends StatelessWidget {
  const HistoryTitle({super.key});

  static const List<int> _flexibleSpace = [1, 2, 2, 4, 2, 2, 2, 2, 1];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            AppStrings.historyHeader.length,
            (index) => Expanded(
                  flex: _flexibleSpace[index],
                  child: HeaderCell(
                    text: AppStrings.historyHeader[index],
                    fontSize: 14,
                  ),
                )).toList(),
      ),
    );
  }
}
