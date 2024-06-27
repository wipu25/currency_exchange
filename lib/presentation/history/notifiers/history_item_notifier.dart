import 'package:currency_exchange/models/client_info.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:currency_exchange/presentation/calculate/services/print_receipt_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyItemProvider = NotifierProvider.family
    .autoDispose<HistoryItemNotifier, TransactionItem, TransactionItem>(
        (HistoryItemNotifier.new));

class HistoryItemNotifier
    extends AutoDisposeFamilyNotifier<TransactionItem, TransactionItem> {
  final nameTextField = TextEditingController();
  final addressTextField = TextEditingController();
  final idTextField = TextEditingController();

  Future<void> printTransaction() async {
    PrintReceiptService().initPrint(state, idTextField.text);
  }

  Future<void> cancelTransaction() async {
    state = state.copyWith(paymentMethod: PaymentMethod.cancel);
  }

  bool get isClientInfoComplete =>
      nameTextField.text.isNotEmpty &&
      addressTextField.text.isNotEmpty &&
      idTextField.text.isNotEmpty;

  void updateClientInfo() {
    final newClientInfo =
        ClientInfo(name: nameTextField.text, address: addressTextField.text);
    state = state.copyWith(clientInfo: newClientInfo);
  }

  @override
  TransactionItem build(TransactionItem arg) {
    nameTextField.text = arg.clientInfo?.name ?? '';
    addressTextField.text = arg.clientInfo?.address ?? '';
    idTextField.text = arg.clientInfo?.id ?? '';
    return arg;
  }
}