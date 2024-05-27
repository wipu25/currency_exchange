import 'dart:convert';

import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:currency_exchange/presentation/history/models/history_screen_state.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:currency_exchange/services/firebase_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final historyNotifier =
    StateNotifierProvider<HistoryScreenNotifier, HistoryScreenState>(
        (ref) => HistoryScreenNotifier(ref));

class HistoryScreenNotifier extends StateNotifier<HistoryScreenState> {
  final Ref _ref;
  HistoryScreenNotifier(this._ref)
      : super(const HistoryScreenState(
            [], [], false, false, false, false, null, {}, {}, {}));

  final _headerTitle = [
    'วันที่',
    'เวลาธุรกรรม',
    'ซื้อ/ขาย',
    'สกุลเงิน',
    'ธนบัตรที่รับ',
    'ราคา',
    'จำนวน',
    'ราคารวม',
    'จ่ายผ่าน',
    'เพิ่มเติม'
  ];

  String formatDateTime(DateTime? dateTime) =>
      DateFormat('dd/MM/yyyy').format(dateTime ?? DateTime.now()).toString();
  List<String> get headerTitle => _headerTitle;

  Future<void> init() async {
    state = state.copyWith(isLoading: true, dateTimeDisplay: DateTime.now());
    await _getTransaction(state.dateTimeDisplay!);
    final currencyListService = _ref.read(currencyListProvider);
    for (var i = 0; i < currencyListService.currencyList.length; i++) {
      final newFilter = Map<String, bool>.from(state.currencyFilter);
      newFilter[currencyListService.currencyList[i].currency] = true;
      state = state.copyWith(currencyFilter: newFilter);
    }
    for (var i in PaymentMethod.values) {
      final newFilter = Map<String, bool>.from(state.paymentFilter);
      newFilter[i.getString()] = true;
      state = state.copyWith(paymentFilter: newFilter);
    }
    for (var i in Transaction.values) {
      final newFilter = Map<String, bool>.from(state.transactionFilter);
      newFilter[i.name] = true;
      state = state.copyWith(transactionFilter: newFilter);
    }
    state = state.copyWith(isLoading: false);
  }

  Future<void> _getTransaction(DateTime dateTime) async {
    try {
      final currentDate = DateFormat('yyyy-MM-dd').format(dateTime);
      final todayFile =
          await _ref.read(firebaseProvider).getTransactionFile(currentDate);
      state = state.copyWith(
          savedHistoryList: List<TransactionItem>.from(json
              .decode(utf8.decode(todayFile!))['transaction']
              .map((item) => TransactionItem.fromJson(item))));

      if (state.savedHistoryList.any((element) =>
          element.totalSellPrice == null && element.totalBuyPrice == null)) {
        _calculateTotal();
      }
    } catch (e) {
      if (e is PlatformException) {
        if (e.code == 'object-not-found' ||
            (e.code == 'firebase_storage' &&
                (e.details as Map<dynamic, dynamic>)['code'] ==
                    'object-not-found')) {
          state = state.copyWith(savedHistoryList: []);
        }
      }
      debugPrint(e.toString());
    }
    state = state.copyWith(historyList: state.savedHistoryList);
  }

  void _calculateTotal() {
    for (var index = 0; index < state.savedHistoryList.length; index++) {
      final item = state.savedHistoryList[index];
      if (item.totalSellPrice == null && item.totalBuyPrice == null) {
        final newList = state.savedHistoryList;
        newList[index] = TransactionItem(
            calculatedItem: item.calculatedItem,
            dateTime: item.dateTime,
            paymentMethod: item.paymentMethod,
            totalBuyPrice: item.calculatedItem
                .where((element) => element.transaction == Transaction.buy)
                .fold(
                    0.0,
                    (previousValue, element) =>
                        previousValue! + element.totalPrice),
            totalSellPrice: item.calculatedItem
                .where(
                    (element) => element.transaction == Transaction.sell.name)
                .fold(
                    0.0,
                    (previousValue, element) =>
                        previousValue! + element.totalPrice));
        state = state.copyWith(savedHistoryList: newList);
      }
    }
    _saveTransaction();
  }

  Future<void> _saveTransaction() async {
    final historyDate = DateFormat('yyyy-MM-dd').format(state.dateTimeDisplay!);
    final map = {
      'transaction': List.from(state.savedHistoryList.map((e) => e.toJson()))
    };
    try {
      await _ref.read(firebaseProvider).saveTransactionFile(map, historyDate);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> selectDateTime(DateTime pickedDate) async {
    state = state.copyWith(isLoading: true, dateTimeDisplay: pickedDate);
    await _getTransaction(pickedDate);
    filterItem();
    state = state.copyWith(isLoading: false, isFilterUpdate: true);
  }

  filterItem() {
    if (state.isFilterUpdate == false) {
      return;
    }
    state = state.copyWith(isFilterUpdate: false, isLoading: true);
    state = state.copyWith(historyList: List.from(state.savedHistoryList));
    final currencyFilter = state.currencyFilter;
    final paymentFilter = state.paymentFilter;
    final transactionFilter = state.transactionFilter;
    final removeCurrency = currencyFilter.keys
        .where((element) => currencyFilter[element] == false)
        .toList();
    final removePayment = paymentFilter.keys
        .where((element) => paymentFilter[element] == false)
        .toList();
    final removeTransaction = transactionFilter.keys
        .where((element) => transactionFilter[element] == false)
        .toList();
    for (var i = 0; i < state.historyList.length; i++) {
      if (removePayment
          .contains(state.historyList[i].paymentMethod.getString())) {
        final newList = state.historyList;
        newList.removeAt(i);
        state = state.copyWith(historyList: newList);
        i--;
        continue;
      }
      final removeList = state.historyList[i].calculatedItem.toList();
      removeList.removeWhere((element) {
        final isCurrency = removeCurrency.contains(element.currency.toString());
        final isTransaction =
            removeTransaction.contains(element.transaction.toString());
        return isCurrency || isTransaction;
      });
      if (removeList.isEmpty) {
        final newList = state.historyList;
        newList.removeAt(i);
        state = state.copyWith(historyList: newList);
        i--;
        continue;
      }
      final newList = state.historyList;
      newList[i] = newList[i].copyWith(calculatedItem: removeList);
      state = state.copyWith(historyList: newList);
    }
    state = state.copyWith(isLoading: false);
  }
}
