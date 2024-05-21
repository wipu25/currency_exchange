import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/summary_dialog_model.dart';
import 'package:currency_exchange/presentation/calculate/notifier/summary_dialog_notifier.dart';
import 'package:currency_exchange/presentation/widgets/custom_button.dart';
import 'package:currency_exchange/presentation/widgets/display_transaction_dialog.dart';
import 'package:currency_exchange/presentation/widgets/info_text_field.dart';
import 'package:currency_exchange/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SummaryDialog extends ConsumerWidget {
  const SummaryDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (_, ref, __) {
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
                  if (ref
                      .watch(summaryDialogStateProvider.notifier)
                      .isContainSell)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border:
                                Border.all(color: Colors.blueAccent, width: 1)),
                        padding: const EdgeInsets.all(8.0),
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //TODO: refactor code
                            InfoTextField(
                              header: AppStrings.name,
                              controller: TextEditingController(),
                              onChanged: (string) => ref
                                  .read(summaryDialogStateProvider.notifier)
                                  .updateField(string, ClientField.name),
                              hintText: AppStrings.hintName,
                            ),
                            InfoTextField(
                              header: AppStrings.id,
                              controller: TextEditingController(),
                              onChanged: (string) => ref
                                  .read(summaryDialogStateProvider.notifier)
                                  .updateField(string, ClientField.id),
                              hintText: AppStrings.hintID,
                            ),
                            InfoTextField(
                              header: AppStrings.address,
                              controller: TextEditingController(),
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
                      currentTransaction: ref
                          .watch(summaryDialogStateProvider.notifier)
                          .currentTransaction),
                ],
              ),
        actions: <Widget>[
          //TODO: refactor code
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (ref.watch(summaryDialogStateProvider).isInfoFilled ||
                  !ref
                      .watch(summaryDialogStateProvider.notifier)
                      .isContainSell) ...[
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
                        var snackBar = const SnackBar(
                            content: Text(AppStrings.successPrint));
                        Navigator.of(context).pop();
                        if (!value) {
                          snackBar = const SnackBar(
                            content: Text(AppStrings.alertPrint),
                          );
                          return;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        ref.read(summaryDialogStateProvider.notifier).save();
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
                  onPressed: () async {
                    ref
                        .read(summaryDialogStateProvider.notifier)
                        .saveClientInfo();
                    await ref
                        .read(summaryDialogStateProvider.notifier)
                        .save()
                        .then((value) => Navigator.of(context).pop());
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
                  Navigator.of(context).pop();
                },
                bgColor: Colors.redAccent,
              ),
            ],
          )
        ],
      );
    });
  }
}
