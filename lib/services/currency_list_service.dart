import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:flutter/cupertino.dart';

class CurrencyListService extends ChangeNotifier {
  final List<List<double?>> _buyCurrencyList = [];
  final List<List<double?>> _sellCurrencyList = [];
  List<Country> _currencyList = <Country>[];

  List<Country> get currencyList => _currencyList;

  void setCurrencyList(List<Country> value) {
    _currencyList = value;
    notifyListeners();
  }

  void setBuyCurrencyList(int currency, int rate, double? amount) {
    _buyCurrencyList[currency][rate] = amount;
  }

  void setSellCurrencyList(int currency, int rate, double? amount) {
    _sellCurrencyList[currency][rate] = amount;
  }

  List<PriceRange> _getPriceRange(
      Country currentCountry, int index, PriceType type) {
    final currentPriceRange = type == PriceType.buy
        ? currentCountry.buyPriceRange
        : currentCountry.sellPriceRange;
    final currencyList =
        type == PriceType.buy ? _buyCurrencyList : _sellCurrencyList;
    final List<PriceRange> priceRange = [];
    for (var j = 0; j < currentPriceRange.length; j++) {
      final currentRange = currentPriceRange[j];
      priceRange.add(PriceRange(
          min: currentRange.min,
          max: currentRange.max,
          price: currencyList[index][j]));
    }
    return priceRange;
  }

  void updateNewCurrencyList() {
    for (var i = 0; i < _currencyList.length; i++) {
      final currentCountry = _currencyList[i];
      final newCountry = Country(
          logo: currentCountry.logo,
          currency: currentCountry.currency,
          countryName: currentCountry.countryName,
          buyPriceRange: _getPriceRange(currentCountry, i, PriceType.buy),
          sellPriceRange: _getPriceRange(currentCountry, i, PriceType.sell));
      _currencyList[i] = newCountry;
    }
    notifyListeners();
  }

  void generateBuySellList() {
    for (var currency in _currencyList) {
      final List<double?> buyRangeList = [];
      final List<double?> sellRangeList = [];
      for (var buyPriceRange in currency.buyPriceRange) {
        buyRangeList.add(buyPriceRange.price);
      }
      for (var sellPriceRange in currency.sellPriceRange) {
        sellRangeList.add(sellPriceRange.price);
      }
      _buyCurrencyList.add(buyRangeList);
      _sellCurrencyList.add(sellRangeList);
    }
  }

  void _addAmount(int currency, int rate, double? amount, PriceType type) {
    if (type == PriceType.sell) {
      setSellCurrencyList(currency, rate, amount);
    } else {
      setBuyCurrencyList(currency, rate, amount);
    }
  }

  bool addRate(int currency, int rate, String value, PriceType type) {
    try {
      if (value.isEmpty) {
        _addAmount(currency, rate, null, type);
        throw CalculateException('Number is Empty');
      }
      final amount = double.parse(value);
      if (amount.isNegative) {
        _addAmount(currency, rate, null, type);
        throw CalculateException('Number is negative');
      }
      _addAmount(currency, rate, amount, type);
      if (_checkIsFieldEmpty(PriceType.buy) &&
          _checkIsFieldEmpty(PriceType.sell)) {
        return true;
      }
    } on CalculateException catch (_) {
      return false;
    }
    return false;
  }

  bool _checkIsFieldEmpty(PriceType type) {
    final checkList =
        type == PriceType.buy ? _buyCurrencyList : _sellCurrencyList;
    for (var list in checkList) {
      for (var currency in list) {
        if (currency == null) {
          return false;
        }
      }
    }
    return true;
  }
}
