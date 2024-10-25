import 'package:thanarak_exchange/constants/app_strings.dart';
import 'package:thanarak_exchange/models/exception.dart';
import 'package:thanarak_exchange/presentation/calculate/models/summary_dialog_model.dart';
import 'package:thanarak_exchange/presentation/calculate/notifier/summary_dialog_notifier.dart';
import 'package:thanarak_exchange/presentation/calculate/notifier/summary_panel_notifier.dart';
import 'package:thanarak_exchange/presentation/calculate/services/receipt_service_notifier.dart';
import 'package:thanarak_exchange/presentation/widgets/custom_button.dart';
import 'package:thanarak_exchange/presentation/widgets/display_transaction_dialog.dart';
import 'package:thanarak_exchange/presentation/widgets/info_text_field.dart';
import 'package:thanarak_exchange/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SummaryDialog extends ConsumerStatefulWidget {
  const SummaryDialog({super.key});

  @override
  ConsumerState<SummaryDialog> createState() => _SummaryDialogState();
}

class _SummaryDialogState extends ConsumerState<SummaryDialog> {
  final nameField = TextEditingController();
  final addressField = TextEditingController();
  final idField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text(AppStrings.print),
      content: ref.watch(summaryDialogStateProvider).billOperation !=
              BillOperation.none
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ref
                      .watch(summaryDialogStateProvider)
                      .billOperation
                      .getString(),
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
                if (ref.watch(summaryDialogStateProvider).clientInfo != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border:
                              Border.all(color: Colors.blueAccent, width: 3)),
                      padding: const EdgeInsets.all(8.0),
                      width: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //TODO: refactor code
                          InfoTextField(
                            header: AppStrings.name,
                            controller: nameField,
                            onChanged: (string) => ref
                                .read(summaryDialogStateProvider.notifier)
                                .updateField(string, ClientField.name),
                            hintText: AppStrings.hintName,
                          ),
                          InfoTextField(
                            header: AppStrings.id,
                            controller: idField,
                            onChanged: (string) => ref
                                .read(summaryDialogStateProvider.notifier)
                                .updateField(string, ClientField.id),
                            hintText: AppStrings.hintID,
                          ),
                          InfoTextField(
                            header: AppStrings.address,
                            controller: addressField,
                            onChanged: (string) => ref
                                .read(summaryDialogStateProvider.notifier)
                                .updateField(string, ClientField.address),
                            hintText: AppStrings.hintAddress,
                            maxLines: 3,
                          )
                        ],
                      ),
                    ),
                  ),
                DisplayTransactionDialog(
                    currentTransaction:
                        ref.read(receiptProvider).currentTransaction),
              ],
            ),
      actions: <Widget>[
        //TODO: refactor code
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: AppStrings.print,
              onPressed: () {
                try {
                  ref
                      .read(summaryDialogStateProvider.notifier)
                      .saveClientInfo();
                  ref
                      .read(summaryDialogStateProvider.notifier)
                      .createPdf()
                      .then((value) {
                    var snackBar =
                        const SnackBar(content: Text(AppStrings.successPrint));
                    Navigator.of(context).pop();
                    if (!value) {
                      snackBar = const SnackBar(
                        content: Text(AppStrings.alertPrint),
                      );
                      return;
                    }
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    ref.read(summaryDialogStateProvider.notifier).save();
                    ref.read(summaryPanelNotifier.notifier).clear();
                  });
                } catch (e) {
                  final snackBar = SnackBar(content: Text(e.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              bgColor: Colors.lightGreen,
            ),
            const SizedBox(
              width: 8,
            ),
            CustomButton(
              text: AppStrings.save,
              onPressed: () {
                try {
                  ref
                      .read(summaryDialogStateProvider.notifier)
                      .saveClientInfo();
                  ref
                      .read(summaryDialogStateProvider.notifier)
                      .save()
                      .then((value) {
                    Navigator.of(context).pop();
                    ref.read(summaryPanelNotifier.notifier).clear();
                  });
                } catch (e) {
                  final snackBar = SnackBar(
                      content: Text(e is ClientInfoException
                          ? AppStrings.clientInfoIncomplete
                          : e.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              bgColor: Colors.blueAccent,
            ),
            const SizedBox(
              width: 8,
            ),
            CustomButton(
              text: AppStrings.back,
              onPressed: () {
                Navigator.of(context).pop();
              },
              bgColor: Colors.redAccent,
            ),
          ],
        )
      ],
    );
  }
}
