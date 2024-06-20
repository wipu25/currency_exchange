import 'dart:convert';

import 'package:currency_exchange/models/client_info.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:currency_exchange/presentation/calculate/models/summary_dialog_model.dart';
import 'package:currency_exchange/presentation/calculate/models/summary_dialog_state.dart';
import 'package:currency_exchange/presentation/calculate/services/print_receipt_service.dart';
import 'package:currency_exchange/presentation/calculate/services/receipt_service_notifier.dart';
import 'package:currency_exchange/services/firebase_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final summaryDialogStateProvider =
    NotifierProvider<SummaryDialogNotifier, SummaryDialogState>(
        SummaryDialogNotifier.new);

class SummaryDialogNotifier extends Notifier<SummaryDialogState> {
  @override
  SummaryDialogState build() =>
      const SummaryDialogState(null, false, BillOperation.none);

  void updateField(String value, ClientField clientField) {
    switch (clientField) {
      case ClientField.name:
        state =
            state.copyWith(clientInfo: state.clientInfo!.copyWith(name: value));
      case ClientField.id:
        state =
            state.copyWith(clientInfo: state.clientInfo!.copyWith(id: value));
      case ClientField.address:
        state = state.copyWith(
            clientInfo: state.clientInfo!.copyWith(address: value));
    }
    state = state.copyWith(
        isInfoFilled: state.clientInfo!.name!.isNotEmpty &&
            state.clientInfo!.id!.isNotEmpty &&
            state.clientInfo!.address!.isNotEmpty);
  }

  void setClientInfo() {
    state = state.copyWith(
        clientInfo: ref.read(receiptProvider).currentTransaction?.clientInfo);
  }

  void saveClientInfo() {
    if (state.clientInfo == null) return;
    if (state.isInfoFilled == false) {
      throw ClientInfoException('Client info incomplete');
    }
    ref.read(receiptProvider).setClientInfo(ClientInfo(
        name: state.clientInfo!.name, address: state.clientInfo!.address));
  }

  Future<void> save() async {
    final currentTransaction = ref.read(receiptProvider).currentTransaction;
    state = state.copyWith(billOperation: BillOperation.save);
    final transactionFile = await _getTransactionFile();
    final timeNow = DateTime.now();
    final currentDate = DateFormat('yyyy-MM-dd').format(timeNow);
    if (transactionFile == null) {
      final map = {
        'transaction': [currentTransaction!.toJson()]
      };
      try {
        await ref.read(firebaseProvider).saveTransactionFile(map, currentDate);
        _clearAllCurrencyItem();
        state = state.copyWith(billOperation: BillOperation.none);
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      final oldTransaction = List<TransactionItem>.from(json
          .decode(utf8.decode(transactionFile))['transaction']
          .map((item) => TransactionItem.fromJson(item)));
      final saveTransaction = [currentTransaction!] + oldTransaction;
      final map = {
        'transaction': List.from(saveTransaction.map((e) => e.toJson()))
      };
      try {
        await ref.read(firebaseProvider).saveTransactionFile(map, currentDate);
        _clearAllCurrencyItem();
        state = state.copyWith(billOperation: BillOperation.none);
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  void _clearAllCurrencyItem() {
    ref.read(receiptProvider).clearItem();
  }

  //move to current transaction service
  Future<Uint8List?> _getTransactionFile() async {
    try {
      final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final transactionFile =
          await ref.read(firebaseProvider).getTransactionFile(currentDate);
      return transactionFile;
    } catch (e) {
      return null;
    }
  }

  Future<bool> createPdf() async {
    state = state.copyWith(billOperation: BillOperation.print);
    if (!kReleaseMode) {
      return true;
    }
    final result = await PrintReceiptService().initPrint(
        ref.read(receiptProvider).currentTransaction, state.clientInfo!.id);
    if (!result) {
      state = state.copyWith(billOperation: BillOperation.none);
    }
    return result;
  }
}
