import 'dart:convert';

import 'package:currency_exchange/models/transaction_item.dart';
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
  DateTime _dateTimeDisplay = DateTime.now();
  // final _paymentMethodFilter = null;
  final _headerTitle = [
    'วันที่',
    'เวลาธุรกรรม',
    'ซื้อ - ขาย',
    'สกุลเงิน',
    'ธนบัตรที่รับ',
    'ราคา',
    'จำนวน',
    'ราคารวม',
    'จ่ายผ่าน'
  ];

  bool get isLoading => _isLoading;
  List<TransactionItem> get historyList => _historyList;
  DateTime get dateTimeDisplay => _dateTimeDisplay;
  List<String> get headerTitle => _headerTitle;

  Future<void> init() async {
    await getTransaction(DateTime.now());
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

  Future<void> selectDateTime(DateTime pickedDate) async {
    _isLoading = true;
    _dateTimeDisplay = pickedDate;
    notifyListeners();
    await getTransaction(pickedDate);
    _isLoading = false;
  }
}
