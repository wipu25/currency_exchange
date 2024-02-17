import 'package:currency_exchange/models/calculated_item.dart';
import 'package:currency_exchange/models/exchange_item.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ReceiptService extends ChangeNotifier {
  TransactionItem? _currentTransaction;
  double _totalItemAmount = 0.0;
  double _totalItemPrice = 0.0;
  double _totalBuyPrice = 0.0;
  double _totalSellPrice = 0.0;
  final List<ExchangeItem> _currencyItem = [];
  Transaction _transaction = Transaction.buy;
  PaymentMethod _payment = PaymentMethod.cash;

  TransactionItem? get currentTransaction => _currentTransaction;
  double get totalItemAmount => _totalItemAmount;
  double get totalItemPrice => _totalItemPrice;
  double get totalBuyPrice => _totalBuyPrice;
  double get totalSellPrice => _totalSellPrice;
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
    _totalItemAmount += addAmount;
    _totalItemPrice += addPrice;
    notifyListeners();
  }

  removeTotal(double removeAmount, double removePrice) {
    _totalItemAmount -= removeAmount;
    _totalItemPrice -= removePrice;
    notifyListeners();
  }

  clearTotal() {
    _totalItemPrice = 0.0;
    _totalItemAmount = 0.0;
    notifyListeners();
  }

  addCurrencyItem(List<PriceRange> priceRange,
      List<CalculatedItem> calculatedItem, String currency) {
    if (_transaction == Transaction.buy) {
      _totalBuyPrice += _totalItemPrice;
    } else {
      _totalSellPrice += _totalItemAmount;
    }
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
                amountExchange: index.amountExchange + _totalItemAmount,
                totalPrice: _totalItemPrice + index.totalPrice,
                currency: index.currency,
                transaction: index.transaction));
        notifyListeners();
        return;
      }
    }
    _currencyItem.add(ExchangeItem(
        priceRange: priceRange,
        calculatedItem: calculatedItem,
        amountExchange: _totalItemAmount,
        totalPrice: _totalItemPrice,
        currency: currency,
        transaction: _transaction.name));
    notifyListeners();
  }

  removeItem(int index) {
    if (_currencyItem[index].transaction == Transaction.buy.name) {
      _totalBuyPrice -= _currencyItem[index].totalPrice;
    } else {
      _totalSellPrice -= _currencyItem[index].amountExchange;
    }
    _currencyItem.removeAt(index);
    notifyListeners();
  }

  clearItem() {
    _totalBuyPrice = 0.0;
    _currencyItem.clear();
    notifyListeners();
  }

  setCurrentTransaction() {
    final timeNow = DateTime.now();
    _currentTransaction = TransactionItem(
        totalSellPrice: _totalSellPrice,
        totalBuyPrice: _totalBuyPrice,
        calculatedItem: _currencyItem,
        dateTime: DateFormat('yyyy-MM-dd_HH:mm:ss').format(timeNow),
        paymentMethod: _payment);
    notifyListeners();
  }
}
