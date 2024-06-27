import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/helpers/date_time_format.dart';
import 'package:currency_exchange/presentation/history/notifiers/history_notifier.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateTimeButton extends ConsumerWidget {
  const DateTimeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTimeDisplay = ref.watch(historyNotifier).dateTimeDisplay;
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
          ref.read(historyNotifier.notifier).selectDateTime(pickedDate);
        }
      },
    );
  }
}
