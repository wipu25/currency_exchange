import 'package:thanarak_exchange/constants/app_strings.dart';
import 'package:thanarak_exchange/presentation/history/history_notifier.dart';
import 'package:thanarak_exchange/presentation/history/widgets/date_time_button.dart';
import 'package:thanarak_exchange/presentation/history/widgets/filter.dart';
import 'package:thanarak_exchange/presentation/history/widgets/history_table.dart';
import 'package:thanarak_exchange/presentation/widgets/custom_button.dart';
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
                const DateTimeButton(),
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
          const Expanded(
            child: HistoryTable(),
          ),
        ],
      ),
    );
  }
}
