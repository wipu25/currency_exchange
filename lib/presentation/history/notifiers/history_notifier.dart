import 'dart:convert';

import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:currency_exchange/presentation/history/models/history_screen_state.dart';
import 'package:currency_exchange/presentation/history/services/filter_service.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:currency_exchange/services/firebase_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final historyNotifier =
    NotifierProvider.autoDispose<HistoryScreenNotifier, HistoryScreenState>(
        HistoryScreenNotifier.new);

enum FilterType { currency, payment, transaction }

class HistoryScreenNotifier extends AutoDisposeNotifier<HistoryScreenState> {
  @override
  HistoryScreenState build() => HistoryScreenState(
      [], [], false, false, false, false, DateTime.now(), {}, {}, {});

  Future<void> init() async {
    state = state.copyWith(isLoading: true, dateTimeDisplay: DateTime.now());
    await _getTransaction(state.dateTimeDisplay!);
    final currencyListService = ref.read(currencyListProvider);
    ref.read(filterService).initFilter(currencyListService.currencyList.length,
        PaymentMethod.values.length, Transaction.values.length);
    state = state.copyWith(isLoading: false);
  }

  Future<void> _getTransaction(DateTime dateTime) async {
    try {
      final currentDate = DateFormat('yyyy-MM-dd').format(dateTime);
      final todayFile =
          await ref.read(firebaseProvider).getTransactionFile(currentDate);
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
        final newList = List<TransactionItem>.from(state.savedHistoryList);
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

  Future<void> updateTransaction(
      TransactionItem newTransaction, int index) async {
    final posSavedHistory = state.savedHistoryList.indexWhere((element) =>
        element.dateTime == state.savedHistoryList[index].dateTime);

    final newSaved = List<TransactionItem>.from(state.savedHistoryList);
    newSaved[posSavedHistory] = newTransaction;
    state = state.copyWith(savedHistoryList: newSaved);

    final newHistory = List<TransactionItem>.from(state.historyList);
    newHistory[index] = state.savedHistoryList[posSavedHistory];
    state = state.copyWith(historyList: newSaved);

    await _saveTransaction();
  }

  Future<void> _saveTransaction() async {
    final historyDate = DateFormat('yyyy-MM-dd').format(state.dateTimeDisplay!);
    final map = {
      'transaction': List.from(state.savedHistoryList.map((e) => e.toJson()))
    };
    try {
      await ref.read(firebaseProvider).saveTransactionFile(map, historyDate);
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
    if (ref.read(filterService).isFilterUpdate == false) {
      return;
    }
    ref.read(filterService).isFilterUpdate = false;
    state = state.copyWith(
        isLoading: true, historyList: List.from(state.savedHistoryList));
    final filterState = ref.read(filterService).historyFilterState;
    var removePayment =
        _filterType(filterState.selectPaymentFilter, PaymentMethod.values);
    var removeTransaction =
        _filterType(filterState.selectTransactionFilter, Transaction.values);
    var removeCurrency = _filterType(filterState.selectCurrencyFilter,
        ref.read(currencyListProvider).currencyList);

    for (var i = 0; i < state.historyList.length; i++) {
      if (removePayment.contains(state.historyList[i].paymentMethod)) {
        final newList = List<TransactionItem>.from(state.historyList);
        newList.removeAt(i);
        state = state.copyWith(historyList: newList);
        i--;
        continue;
      }
      final removeList = state.historyList[i].calculatedItem.toList();
      removeList.removeWhere((element) {
        final isCurrency = removeCurrency.contains(element.currency);
        final isTransaction = removeTransaction.contains(element.transaction);
        return isCurrency || isTransaction;
      });
      if (removeList.isEmpty) {
        final newList = List<TransactionItem>.from(state.historyList);
        newList.removeAt(i);
        state = state.copyWith(historyList: newList);
        i--;
        continue;
      }
      final newList = List<TransactionItem>.from(state.historyList);
      newList[i] = newList[i].copyWith(calculatedItem: removeList);
      state = state.copyWith(historyList: newList);
    }
    state = state.copyWith(isLoading: false);
  }

  List<dynamic> _filterType(List<bool> listValue, List<dynamic> listFilter) {
    var filter = [];
    for (var i = 0; i < listFilter.length; i++) {
      if (listValue[i] == false) {
        filter.add(ref.read(currencyListProvider).currencyList[i].currency);
      }
    }
    return filter;
  }
}
