import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currencyListProvider = Provider((ref) => CurrencyListService());

class CurrencyListService {
  final List<List<String?>> _buyCurrencyList = [];
  final List<List<String?>> _sellCurrencyList = [];
  List<Country> _currencyList = <Country>[];
  bool _isCurrencySet = false;

  bool get isCurrencySet => _isCurrencySet;
  List<Country> get currencyList => _currencyList;
  List<List<String?>> get buyCurrencyList => _buyCurrencyList;
  List<List<String?>> get sellCurrencyList => _sellCurrencyList;

  void setCurrencyDone(bool value) => _isCurrencySet = value;

  void setBuyCurrencyList(int currency, int rate, String? amount) {
    _buyCurrencyList[currency][rate] = amount;
  }

  void setSellCurrencyList(int currency, int rate, String? amount) {
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
      final priceToDouble =
          double.parse(currencyList[index][j]?.replaceAll(',', '') ?? '0.0');
      currencyList[index][j] = priceToDouble.toString();
      priceRange.add(PriceRange(
          min: currentRange.min, max: currentRange.max, price: priceToDouble));
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
    // notifyListeners();
  }

  bool generateBuySellList(List<Country> value) {
    _currencyList = value;
    var isNullItem = false;
    for (var currency in _currencyList) {
      final List<String?> buyRangeList = [];
      final List<String?> sellRangeList = [];
      for (var buyPriceRange in currency.buyPriceRange) {
        var buyPrice = buyPriceRange.getPrice();
        if (buyPriceRange.price == null) {
          isNullItem = true;
          buyPrice = '';
        }
        buyRangeList.add(buyPrice);
      }
      for (var sellPriceRange in currency.sellPriceRange) {
        var sellPrice = sellPriceRange.getPrice();
        if (sellPriceRange.price == null) {
          isNullItem = true;
          sellPrice = '';
        }
        sellRangeList.add(sellPrice);
      }
      _buyCurrencyList.add(buyRangeList);
      _sellCurrencyList.add(sellRangeList);
    }
    return isNullItem;
  }

  void _addAmount(int currency, int rate, String? amount, PriceType type) {
    if (type == PriceType.sell) {
      setSellCurrencyList(currency, rate, amount);
    } else {
      setBuyCurrencyList(currency, rate, amount);
    }
  }

  String? addRate(int currency, int rate, String value, PriceType type) {
    try {
      _addAmount(currency, rate, value, type);
      final buyCheck = _checkEachList(PriceType.buy);
      final sellCheck = _checkEachList(PriceType.sell);
      if (buyCheck == null && sellCheck == null) {
        return null;
      }
      return buyCheck ?? sellCheck;
    } on CalculateException catch (_) {
      return 'Error on add';
    }
  }

  String? _checkEachList(PriceType type) {
    final list = type == PriceType.buy ? _buyCurrencyList : _sellCurrencyList;

    for (var currency in list) {
      for (var value in currency) {
        if (value == null || value.isEmpty) {
          return AppStrings.errorFillAll;
        }
        final amount = double.parse(value.replaceAll(',', ''));
        if (amount.isNegative) {
          return AppStrings.errorNegative;
        }
      }
    }

    return null;
  }
}
