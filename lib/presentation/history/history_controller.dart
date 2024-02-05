import 'dart:convert';

import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:currency_exchange/presentation/calculate/services/print_receipt_service.dart';
import 'package:currency_exchange/services/firebase_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class HistoryController with ChangeNotifier {
  final FirebaseService _firebaseService;

  HistoryController(this._firebaseService);

  List<TransactionItem> _historyList = <TransactionItem>[];
  bool _isLoading = false;
  bool _isCancel = false;
  DateTime _dateTimeDisplay = DateTime.now();
  // final _paymentMethodFilter = null;
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

  bool get isLoading => _isLoading;
  bool get isCancel => _isCancel;
  List<TransactionItem> get historyList => _historyList;
  DateTime get dateTimeDisplay => _dateTimeDisplay;
  List<String> get headerTitle => _headerTitle;

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();
    await getTransaction(DateTime.now());
    _isLoading = false;
    notifyListeners();
  }

  String formatDateTime(DateTime dateTime) =>
      DateFormat('dd/MM/yyyy').format(dateTime).toString();

  Future<void> getTransaction(DateTime dateTime) async {
    try {
      final currentDate = DateFormat('yyyy-MM-dd').format(dateTime);
      final todayFile = await _firebaseService.getTransactionFile(currentDate);
      _historyList = List<TransactionItem>.from(json
          .decode(utf8.decode(todayFile!))['transaction']
          .map((item) => TransactionItem.fromJson(item)));
      if (_historyList.any((element) =>
          element.totalSellPrice == null && element.totalBuyPrice == null)) {
        _calculateTotal();
      }
    } catch (e) {
      if (e is PlatformException) {
        if (e.code == 'object-not-found' ||
            (e.code == 'firebase_storage' &&
                (e.details as Map<dynamic, dynamic>)['code'] ==
                    'object-not-found')) {
          _historyList = [];
        }
      }
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  void _calculateTotal() {
    for (var index = 0; index < _historyList.length; index++) {
      final item = _historyList[index];
      if (item.totalSellPrice == null && item.totalBuyPrice == null) {
        _historyList[index] = TransactionItem(
            calculatedItem: item.calculatedItem,
            dateTime: item.dateTime,
            paymentMethod: item.paymentMethod,
            totalBuyPrice: item.calculatedItem
                .where((element) => element.transaction == Transaction.buy.name)
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
      }
    }
    _saveTransaction();
  }

  Future<void> selectDateTime(DateTime pickedDate) async {
    _isLoading = true;
    _dateTimeDisplay = pickedDate;
    notifyListeners();
    await getTransaction(pickedDate);
    _isLoading = false;
  }

  Future<void> printTransaction(int index) async {
    PrintReceiptService().printThermal(_historyList[index]);
  }

  setCancel(bool value) {
    _isCancel = value;
    notifyListeners();
  }

  Future<void> cancelTransaction(int index) async {
    setCancel(true);
    final oldItem = _historyList[index];

    //TODO: please add cancelling function
    final cancelItem = TransactionItem(
        totalSellPrice: oldItem.totalSellPrice,
        totalBuyPrice: oldItem.totalBuyPrice,
        calculatedItem: oldItem.calculatedItem,
        dateTime: oldItem.dateTime,
        paymentMethod: PaymentMethod.cancel);
    _historyList[index] = cancelItem;
    await _saveTransaction();
    setCancel(false);
  }

  Future<void> _saveTransaction() async {
    final historyDate = DateFormat('yyyy-MM-dd').format(_dateTimeDisplay);
    final map = {'transaction': List.from(_historyList.map((e) => e.toJson()))};
    try {
      await _firebaseService.saveTransactionFile(map, historyDate);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
