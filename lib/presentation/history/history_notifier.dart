import 'dart:convert';

import 'package:thanarak_exchange/models/receipt.dart';
import 'package:thanarak_exchange/models/transaction_item.dart';
import 'package:thanarak_exchange/presentation/history/models/history_screen_state.dart';
import 'package:thanarak_exchange/services/currency_list_service.dart';
import 'package:thanarak_exchange/services/firebase_service.dart';
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
      [], [], false, false, false, false, 0.0, 0.0, DateTime.now(), {}, {}, {});

  var totalDateBuyPrice = 0.0;
  var totalDateSellPrice = 0.0;

  Future<void> init() async {
    state = state.copyWith(isLoading: true, dateTimeDisplay: DateTime.now());
    await _getTransaction(state.dateTimeDisplay!);
    final currencyListService = ref.read(currencyListProvider);
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
      totalDateSellPrice = 0.0;
      totalDateBuyPrice = 0.0;
      final currentDate = DateFormat('yyyy-MM-dd').format(dateTime);
      final todayFile =
          await ref.read(firebaseProvider).getTransactionFile(currentDate);
      state = state.copyWith(
          savedHistoryList: List<TransactionItem>.from(json
              .decode(utf8.decode(todayFile!))['transaction']
              .map((item) => TransactionItem.fromJson(item))));
      for (var item in state.savedHistoryList) {
        if (item.totalSellPrice == null && item.totalBuyPrice == null) {
          await _calculateTotal();
        }
        totalDateBuyPrice += item.totalBuyPrice!;
        totalDateSellPrice += item.totalSellPrice!;
      }
      state = state.copyWith(
          totalDateSellPrice: totalDateSellPrice,
          totalDateBuyPrice: totalDateBuyPrice);
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

  Future<void> _calculateTotal() async {
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
    await _saveTransaction();
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
    if (state.isFilterUpdate == false) {
      return;
    }
    state = state.copyWith(isFilterUpdate: false, isLoading: true);
    state = state.copyWith(historyList: List.from(state.savedHistoryList));
    final currencyFilter = state.currencyFilter;
    final paymentFilter = state.paymentFilter;
    final transactionFilter = state.transactionFilter;
    var totalDateBuyPrice = this.totalDateBuyPrice;
    var totalDateSellPrice = this.totalDateSellPrice;
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
        final newList = List<TransactionItem>.from(state.historyList);
        newList.removeAt(i);
        totalDateSellPrice -= state.historyList[i].totalSellPrice!;
        totalDateBuyPrice -= state.historyList[i].totalBuyPrice!;
        state = state.copyWith(historyList: newList);
        i--;
        continue;
      }
      final removeList = state.historyList[i].calculatedItem.toList();
      removeList.removeWhere((item) {
        final isRemove = removeCurrency.contains(item.currency.toString()) ||
            removeTransaction.contains(item.transaction.name);
        if (isRemove) {
          item.transaction == Transaction.sell
              ? totalDateSellPrice -= item.amountExchange
              : totalDateBuyPrice -= item.totalPrice;
        }
        return isRemove;
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
    state = state.copyWith(
        isLoading: false,
        totalDateBuyPrice: totalDateBuyPrice,
        totalDateSellPrice: totalDateSellPrice);
  }

  updateFilter(String name, bool? value, FilterType filterType) {
    switch (filterType) {
      case FilterType.payment:
        final filterList = Map<String, bool>.from(state.paymentFilter);
        filterList[name] = value ?? filterList[name]!;
        state = state.copyWith(paymentFilter: filterList);
      case FilterType.transaction:
        final filterList = Map<String, bool>.from(state.transactionFilter);
        filterList[name] = value ?? filterList[name]!;
        state = state.copyWith(transactionFilter: filterList);
      default:
        final filterList = Map<String, bool>.from(state.currencyFilter);
        filterList[name] = value ?? filterList[name]!;
        state = state.copyWith(currencyFilter: filterList);
    }
    state = state.copyWith(isFilterUpdate: true);
  }

  selectAllFilter(bool newValue) {
    final newFilter = Map<String, bool>.from(state.currencyFilter);
    newFilter.updateAll((key, value) => value = newValue);
    state = state.copyWith(currencyFilter: newFilter, isFilterUpdate: true);
  }
}
