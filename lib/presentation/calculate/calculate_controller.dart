import 'dart:convert';

import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/calculated_item.dart';
import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/models/exchange_item.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:currency_exchange/presentation/calculate/services/receipt_service.dart';
import 'package:currency_exchange/services/firebase_service.dart';
import 'package:currency_exchange/presentation/calculate/services/print_receipt_service.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class CalculateController with ChangeNotifier {
  final FirebaseService _firebaseService;

  CalculateController(this._firebaseService);

  final _receiptService = ReceiptService();
  Country? _selectedCurrency;
  bool _isAddEnable = false;
  List<PriceRange> _selectedPriceRange = [];
  List<String> _inputPrice = [];
  List<CalculatedItem> _calculatedItem = [];
  int _currentInsert = 0;
  bool _isSaving = false;

  Transaction get transaction => _receiptService.transaction;
  PaymentMethod get payment => _receiptService.payment;
  List<ExchangeItem> get currencyItem => _receiptService.currencyItem;
  double get totalAmount => _receiptService.totalAmount;
  double get totalPrice => _receiptService.totalPrice;
  bool get isTransactionBuy => _receiptService.isTransactionBuy;

  Country? get selectedCountry => _selectedCurrency;
  List<PriceRange> get selectedPriceRange => _selectedPriceRange;
  bool get isAddEnable => _isAddEnable;
  bool get isSaving => _isSaving;
  List<String> get inputPrice => _inputPrice;
  List<CalculatedItem> get calculatedItem => _calculatedItem;

  void init(Country country) {
    setSelectedCurrency(country);
  }

  void removeSplitItem(int position) {
    _selectedPriceRange.removeAt(position);
    _inputPrice.removeAt(position);
    _calculatedItem.removeAt(position);
    if (position == _currentInsert) {
      _currentInsert = 0;
    }
    notifyListeners();
  }

  void addSplitItem() {
    _isAddEnable = false;
    _selectedPriceRange.add(_receiptService.isTransactionBuy
        ? _selectedCurrency!.buyPriceRange.first
        : _selectedCurrency!.sellPriceRange.first);
    _inputPrice.add('0.0');
    _calculatedItem.add(const CalculatedItem(amount: 0.0, price: 0.0));
    notifyListeners();
  }

  void updateSelectedPriceRange(int position, PriceRange value) {
    _selectedPriceRange[position] = value;
    calculateAmount(position, _inputPrice[position]);
    notifyListeners();
  }

  void updateTransaction() {
    _receiptService.setTransaction();
    _clearCurrentBill();
    _setSelectedPriceRange();
    addSplitItem();
  }

  void updatePayment(PaymentMethod? value) {
    _receiptService.setPayment(value);
    notifyListeners();
  }

  void setSelectedCurrency(Country country) {
    _selectedCurrency = country;
    _clearCurrentBill();
    _setSelectedPriceRange();
    addSplitItem();
  }

  void _setSelectedPriceRange() {
    List.generate(
        _selectedPriceRange.length,
        (index) => _selectedPriceRange[index] = _receiptService.isTransactionBuy
            ? _selectedCurrency!.buyPriceRange.first
            : _selectedCurrency!.sellPriceRange.first);
    notifyListeners();
  }

  void _clearCurrentBill() {
    _selectedPriceRange = [];
    _inputPrice = [];
    _calculatedItem = [];
    _clearTotalValue();
    notifyListeners();
  }

  void calculateAmount(int position, String value) {
    _inputPrice[position] = value;
    if (value.isEmpty) {
      throw CalculateException(AppStrings.emptyAlert);
    }
    final amount = double.parse(value);
    if (amount.isNegative) {
      throw CalculateException(AppStrings.negativeAlert);
    }
    _calculatedItem[position] = CalculatedItem(
        amount: amount,
        price: (_selectedPriceRange[position].price ?? 0) * amount);
    _isAddEnable = true;
    calculateTotal();
  }

  void calculateTotal() {
    bool shouldEnableAdd = true;
    _clearTotalValue();
    for (var calculatedItem in _calculatedItem) {
      if (calculatedItem.price == 0.0) {
        shouldEnableAdd = false;
      }
      _receiptService.addTotal(calculatedItem.amount, calculatedItem.price);
    }
    _isAddEnable = shouldEnableAdd;
    if (_receiptService.totalAmount == 0.0 ||
        _receiptService.totalPrice == 0.0) {
      _isAddEnable = false;
    }
    notifyListeners();
  }

  void disableAdd() {
    _isAddEnable = false;
    _clearTotalValue();
    notifyListeners();
  }

  void addToReceipt() {
    _receiptService.addCurrencyItem(
        _selectedPriceRange, _calculatedItem, _selectedCurrency!.currency);
    _clearCurrentBill();
    addSplitItem();
  }

  void _clearTotalValue() {
    _receiptService.clearTotal();
  }

  void removeCurrencyItem(int index) {
    _receiptService.removeItem(index);
    notifyListeners();
  }

  void clearAllCurrencyItem() {
    _receiptService.clearItem();
    notifyListeners();
  }

  void _setCurrentTransaction() {
    _receiptService.setCurrentTransaction();
    notifyListeners();
  }

  Future<void> save() async {
    final currentTransaction = _receiptService.currentTransaction;
    _isSaving = true;
    final transactionFile = await _getTransactionFile();
    final timeNow = DateTime.now();
    final currentDate = DateFormat('yyyy-MM-dd').format(timeNow);
    if (transactionFile == null) {
      final map = {
        'transaction': [currentTransaction!.toJson()]
      };
      try {
        _firebaseService.saveTransactionFile(map, currentDate);
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      final oldTransaction = List<TransactionItem>.from(json
          .decode(utf8.decode(transactionFile))['transaction']
          .map((item) => TransactionItem.fromJson(item)));
      oldTransaction.add(currentTransaction!);
      final map = {
        'transaction': List.from(oldTransaction.map((e) => e.toJson()))
      };
      try {
        await _firebaseService.saveTransactionFile(map, currentDate);
        _isSaving = false;
        notifyListeners();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  Future<Uint8List?> _getTransactionFile() async {
    try {
      final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final transactionFile =
          await _firebaseService.getTransactionFile(currentDate);
      return transactionFile;
    } catch (e) {
      return null;
    }
  }

  Future<bool> createPdf() async {
    _setCurrentTransaction();
    if (!kReleaseMode) {
      return true;
    }
    return await PrintReceiptService()
        .printThermal(_receiptService.currentTransaction);
  }
}
