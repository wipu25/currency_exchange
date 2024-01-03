import 'package:currency_exchange/models/calculated_item.dart';
import 'package:currency_exchange/models/exchange_item.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ReceiptService extends ChangeNotifier {
  TransactionItem? _currentTransaction;
  double _totalAmount = 0.0;
  double _totalPrice = 0.0;
  final List<ExchangeItem> _currencyItem = [];
  Transaction _transaction = Transaction.buy;
  PaymentMethod _payment = PaymentMethod.cash;

  TransactionItem? get currentTransaction => _currentTransaction;
  double get totalAmount => _totalAmount;
  double get totalPrice => _totalPrice;
  List<ExchangeItem> get currencyItem => _currencyItem;
  PaymentMethod get payment => _payment;
  Transaction get transaction => _transaction;
  bool get isTransactionBuy => _transaction == Transaction.buy;

  setTransaction() {
    if (isTransactionBuy) {
      _transaction = Transaction.sell;
      return;
    }
    _transaction = Transaction.buy;
    notifyListeners();
  }

  setPayment(PaymentMethod? value) {
    if (value == null) return;
    _payment = value;
    notifyListeners();
  }

  addTotal(double addAmount, double addPrice) {
    _totalAmount += addAmount;
    _totalPrice += addPrice;
    notifyListeners();
  }

  clearTotal() {
    _totalPrice = 0.0;
    _totalAmount = 0.0;
    notifyListeners();
  }

  addCurrencyItem(List<PriceRange> priceRange,
      List<CalculatedItem> calculatedItem, String currency) {
    for (var i = 0; i < _currencyItem.length; i++) {
      final index = _currencyItem[i];
      if (index.currency == currency &&
          index.transaction == _transaction.name) {
        _currencyItem.removeAt(i);
        _currencyItem.insert(
            i,
            ExchangeItem(
                priceRange: index.priceRange + priceRange,
                calculatedItem: index.calculatedItem + calculatedItem,
                amountExchange: index.amountExchange + _totalAmount,
                totalPrice: _totalPrice + index.totalPrice,
                currency: index.currency,
                transaction: index.transaction));
        return;
      }
    }
    _currencyItem.add(ExchangeItem(
        priceRange: priceRange,
        calculatedItem: calculatedItem,
        amountExchange: _totalAmount,
        totalPrice: _totalPrice,
        currency: currency,
        transaction: _transaction.name));
    notifyListeners();
  }

  removeItem(int index) {
    _currencyItem.removeAt(index);
    notifyListeners();
  }

  clearItem() {
    _currencyItem.clear();
    notifyListeners();
  }

  setCurrentTransaction() {
    final timeNow = DateTime.now();
    _currentTransaction = TransactionItem(
        calculatedItem: _currencyItem,
        dateTime: DateFormat('yyyy-MM-dd_HH:mm:ss').format(timeNow),
        paymentMethod: _payment);
    notifyListeners();
  }
}
