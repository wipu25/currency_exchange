import 'dart:core';

import 'package:currency_exchange/models/client_info.dart';
import 'package:currency_exchange/presentation/exchange/models/exchange_item.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final receiptProvider = Provider((ref) => ReceiptStateService());

class ReceiptStateService {
  TransactionItem? _currentTransaction;
  double _totalBuyPrice = 0.0;
  double _totalSellPrice = 0.0;
  int _sellTransactionCount = 0;
  List<ExchangeItem> _currencyItem = [];
  PaymentMethod _payment = PaymentMethod.cash;

  TransactionItem? get currentTransaction => _currentTransaction;
  double get totalBuyPrice => _totalBuyPrice;
  double get totalSellPrice => _totalSellPrice;
  List<ExchangeItem> get currencyItem => _currencyItem;
  PaymentMethod get payment => _payment;

  //todo move to dialog
  bool get _isContainSell => _sellTransactionCount > 0;

  setPayment(PaymentMethod? value) {
    if (value == null) return;
    _payment = value;
  }

  addCurrencyItem(ExchangeItem exchangeItem) {
    if (exchangeItem.transaction == Transaction.buy) {
      _totalBuyPrice += exchangeItem.totalPrice;
    } else {
      _sellTransactionCount += 1;
      _totalSellPrice += exchangeItem.amountExchange;
    }
    for (var i = 0; i < _currencyItem.length; i++) {
      final index = _currencyItem[i];
      if (index.currency == exchangeItem.currency &&
          index.transaction == exchangeItem.transaction) {
        _currencyItem.removeAt(i);
        _currencyItem.insert(
            i,
            ExchangeItem(
                priceRange: index.priceRange + exchangeItem.priceRange,
                calculatedItem:
                    index.calculatedItem + exchangeItem.calculatedItem,
                amountExchange:
                    index.amountExchange + exchangeItem.amountExchange,
                totalPrice: exchangeItem.totalPrice + index.totalPrice,
                currency: index.currency,
                transaction: index.transaction));
        return;
      }
    }
    _currencyItem.add(ExchangeItem(
        priceRange: exchangeItem.priceRange,
        calculatedItem: exchangeItem.calculatedItem,
        amountExchange: exchangeItem.amountExchange,
        totalPrice: exchangeItem.totalPrice,
        currency: exchangeItem.currency,
        transaction: exchangeItem.transaction));
  }

  removeItem(int index) {
    if (_currencyItem[index].transaction == Transaction.buy) {
      _totalBuyPrice -= _currencyItem[index].totalPrice;
    } else {
      _sellTransactionCount -= 1;
      _totalSellPrice -= _currencyItem[index].amountExchange;
    }
    _currencyItem.removeAt(index);
  }

  clearItem() {
    _totalBuyPrice = 0.0;
    _totalSellPrice = 0.0;
    _sellTransactionCount = 0;
    _currencyItem = [];
  }

  //todo: check by summary dialog actually no need
  setCurrentTransaction() {
    _currentTransaction = TransactionItem(
        calculatedItem: _currencyItem,
        dateTime: DateFormat('yyyy-MM-dd_HH:mm:ss').format(DateTime.now()),
        paymentMethod: _payment,
        totalSellPrice: _totalSellPrice,
        totalBuyPrice: _totalBuyPrice,
        clientInfo: _isContainSell
            ? const ClientInfo(name: '', id: '', address: '')
            : null);
  }

  setClientInfo(ClientInfo clientInfo) {
    if (_isContainSell) {
      _currentTransaction =
          _currentTransaction!.copyWith(clientInfo: clientInfo);
    }
  }
}
