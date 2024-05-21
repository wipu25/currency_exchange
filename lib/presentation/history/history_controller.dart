import 'dart:convert';

import 'package:currency_exchange/models/client_info.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:currency_exchange/presentation/calculate/services/print_receipt_service.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:currency_exchange/services/firebase_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

enum FilterType { currency, payment, transaction }

class HistoryController with ChangeNotifier {
  final FirebaseService _firebaseService;
  final CurrencyListService _currencyListService;

  HistoryController(this._firebaseService, this._currencyListService);

  List<TransactionItem> _savedHistoryList = <TransactionItem>[];
  List<TransactionItem> _historyList = <TransactionItem>[];
  bool _isFilterUpdate = false;
  bool _isLoading = false;
  bool _isCancel = false;
  DateTime _dateTimeDisplay = DateTime.now();
  final Map<String, bool> _currencyFilter = {};
  final Map<String, bool> _paymentFilter = {};
  final Map<String, bool> _transactionFilter = {};
  final nameTextField = TextEditingController();
  final addressTextField = TextEditingController();
  final idTextField = TextEditingController();
  bool _isClientInfoComplete = false;
  bool get isClientInfoComplete => _isClientInfoComplete;

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
  Map<String, bool> get currencyFilter => _currencyFilter;
  Map<String, bool> get paymentFilter => _paymentFilter;
  Map<String, bool> get transactionFilter => _transactionFilter;

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();
    await getTransaction(DateTime.now());
    for (var i = 0; i < _currencyListService.currencyList.length; i++) {
      _currencyFilter[_currencyListService.currencyList[i].currency] = true;
    }
    for (var i in PaymentMethod.values) {
      _paymentFilter[i.getString()] = true;
    }
    for (var i in Transaction.values) {
      _transactionFilter[i.name] = true;
    }
    _isLoading = false;
    notifyListeners();
  }

  updateFilter(String name, bool? value, FilterType filterType) {
    var filterList = _currencyFilter;
    switch (filterType) {
      case FilterType.payment:
        filterList = _paymentFilter;
      case FilterType.transaction:
        filterList = _transactionFilter;
      default:
        break;
    }
    filterList[name] = value ?? filterList[name]!;
    notifyListeners();
    _isFilterUpdate = true;
  }

  selectAllFilter(bool newValue) {
    _currencyFilter.updateAll((key, value) => value = newValue);
    notifyListeners();
    _isFilterUpdate = true;
  }

  filterItem() {
    if (_isFilterUpdate = false) {
      return;
    }
    _isFilterUpdate = false;
    _isLoading = true;
    notifyListeners();
    _historyList = List.from(_savedHistoryList);
    final removeCurrency = _currencyFilter.keys
        .where((element) => _currencyFilter[element] == false)
        .toList();
    final removePayment = _paymentFilter.keys
        .where((element) => _paymentFilter[element] == false)
        .toList();
    final removeTransaction = _transactionFilter.keys
        .where((element) => _transactionFilter[element] == false)
        .toList();
    for (var i = 0; i < _historyList.length; i++) {
      if (removePayment.contains(_historyList[i].paymentMethod.getString())) {
        _historyList.removeAt(i);
        i--;
        continue;
      }
      final removeList = _historyList[i].calculatedItem.toList();
      removeList.removeWhere((element) {
        final isCurrency = removeCurrency.contains(element.currency);
        final isTransaction = removeTransaction.contains(element.transaction);
        return isCurrency || isTransaction;
      });
      if (removeList.isEmpty) {
        _historyList.removeAt(i);
        i--;
        continue;
      }
      _historyList[i] = _historyList[i].copyWith(calculatedItem: removeList);
    }
    _isLoading = false;
    notifyListeners();
  }

  String formatDateTime(DateTime dateTime) =>
      DateFormat('dd/MM/yyyy').format(dateTime).toString();

  Future<void> getTransaction(DateTime dateTime) async {
    try {
      final currentDate = DateFormat('yyyy-MM-dd').format(dateTime);
      final todayFile = await _firebaseService.getTransactionFile(currentDate);
      _savedHistoryList = List<TransactionItem>.from(json
          .decode(utf8.decode(todayFile!))['transaction']
          .map((item) => TransactionItem.fromJson(item)));
      if (_savedHistoryList.any((element) =>
          element.totalSellPrice == null && element.totalBuyPrice == null)) {
        _calculateTotal();
      }
    } catch (e) {
      if (e is PlatformException) {
        if (e.code == 'object-not-found' ||
            (e.code == 'firebase_storage' &&
                (e.details as Map<dynamic, dynamic>)['code'] ==
                    'object-not-found')) {
          _savedHistoryList = [];
        }
      }
      debugPrint(e.toString());
    }
    _historyList = _savedHistoryList;
    notifyListeners();
  }

  void _calculateTotal() {
    for (var index = 0; index < _savedHistoryList.length; index++) {
      final item = _savedHistoryList[index];
      if (item.totalSellPrice == null && item.totalBuyPrice == null) {
        _savedHistoryList[index] = TransactionItem(
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
      }
    }
    _saveTransaction();
  }

  Future<void> selectDateTime(DateTime pickedDate) async {
    _isLoading = true;
    _dateTimeDisplay = pickedDate;
    notifyListeners();
    await getTransaction(pickedDate);
    _isFilterUpdate = true;
    filterItem();
    _isLoading = false;
  }

  TransactionItem getSavedHistory(int index) {
    final posSavedHistory = _savedHistoryList.indexWhere(
        (element) => element.dateTime == _historyList[index].dateTime);
    final item = _savedHistoryList[posSavedHistory];
    nameTextField.text = item.clientInfo?.name ?? '';
    idTextField.text = item.clientInfo?.id ?? '';
    addressTextField.text = item.clientInfo?.address ?? '';
    return item;
  }

  Future<void> _updateTransaction(int index,
      {PaymentMethod? paymentMethod, ClientInfo? clientInfo}) async {
    final posSavedHistory = _savedHistoryList.indexWhere(
        (element) => element.dateTime == _historyList[index].dateTime);
    var newTransaction = _savedHistoryList[posSavedHistory];
    if (paymentMethod != null) {
      newTransaction = newTransaction.copyWith(paymentMethod: paymentMethod);
    }
    if (clientInfo != null) {
      newTransaction = newTransaction.copyWith(clientInfo: clientInfo);
    }
    _savedHistoryList[posSavedHistory] = newTransaction;
    _historyList[index] = _savedHistoryList[posSavedHistory];
    await _saveTransaction();
  }

  Future<void> printTransaction(int index) async {
    final newClientInfo =
        ClientInfo(name: nameTextField.text, address: addressTextField.text);
    _updateTransaction(index, clientInfo: newClientInfo);
    PrintReceiptService().initPrint(_historyList[index], idTextField.text);
  }

  setCancel(bool value) {
    _isCancel = value;
    notifyListeners();
  }

  Future<void> cancelTransaction(int index) async {
    setCancel(true);
    await _updateTransaction(index, paymentMethod: PaymentMethod.cancel);
    setCancel(false);
  }

  Future<void> _saveTransaction() async {
    final historyDate = DateFormat('yyyy-MM-dd').format(_dateTimeDisplay);
    final map = {
      'transaction': List.from(_savedHistoryList.map((e) => e.toJson()))
    };
    try {
      await _firebaseService.saveTransactionFile(map, historyDate);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void checkClientInfo() {
    final newStatus = nameTextField.text.isNotEmpty &&
        addressTextField.text.isNotEmpty &&
        idTextField.text.isNotEmpty;
    if (_isClientInfoComplete != newStatus) {
      _isClientInfoComplete = newStatus;
      notifyListeners();
    }
  }
}
