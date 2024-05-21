import 'dart:convert';

import 'package:currency_exchange/helpers/number_format.dart';
import 'package:currency_exchange/main.dart';
import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExchangeController with ChangeNotifier {
  final Ref _ref;
  ExchangeController(this._ref);

  bool _isSave = false;
  bool _isEdit = false;
  bool _isCurrencyLoading = false;

  bool get isCurrencyLoading => _isCurrencyLoading;
  bool get isSaveEnable => _isSave;
  bool get isEdit => _isEdit;
  List<Country> get currencyList =>
      _ref.watch(currencyListProvider).currencyList;
  List<List<String?>> get buyCurrencyList =>
      _ref.watch(currencyListProvider).buyCurrencyList;
  List<List<String?>> get sellCurrencyList =>
      _ref.watch(currencyListProvider).sellCurrencyList;

  Future<void> getCurrency() async {
    _isCurrencyLoading = true;
    final currencyFile = await _getCurrencyFile();
    _isSave = !_ref.read(currencyListProvider).generateBuySellList(
        List<Country>.from(json
            .decode(utf8.decode(currencyFile!))['country']
            .map((item) => Country.fromJson(item))));
    _isEdit = true;
    _isCurrencyLoading = false;
  }

  Future<Uint8List?> _getCurrencyFile() async {
    try {
      //   final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      //   final currencyFile =
      //       await _ref.watch(firebaseServiceProvider).getCurrencyFile(date: currentDate);
      final currencyFile =
          await _ref.watch(firebaseServiceProvider).getCurrencyFile();
      _ref.read(currencyListProvider).setCurrencyDone(true);
      // notifyListeners();
      return currencyFile;
      // } on PlatformException catch (e) {
      //   if (e.code == 'object-not-found' ||
      //       (e.code == 'firebase_storage' &&
      //           (e.details as Map<dynamic, dynamic>)['code'] ==
      //               'object-not-found')) {
      //     _isSave = false;
      //     _isEdit = true;
      //     notifyListeners();
      //     return await _ref.watch(firebaseServiceProvider).getCurrencyFile();
      //   }
    } catch (_) {
      throw GetCurrencyException('Something wrong with template files');
    }
  }

  void addRate(int currency, int rate, String value, PriceType type) {
    final numValue = value.replaceAll(',', '');
    final splitDecimal = numValue.split('.');
    final newValue = CustomNumberFormat.fieldFormat(splitDecimal[0]) +
        (splitDecimal.length > 1 ? '.${splitDecimal[1]}' : '');
    final result = _ref
        .watch(currencyListProvider)
        .addRate(currency, rate, newValue, type);
    if (result == null) {
      _updateSave(true);
      return;
    }
    _updateSave(false);
    throw CalculateException(result);
  }

  void onSave() {
    _ref.watch(currencyListProvider).updateNewCurrencyList();
    final map = {
      'country': List.from(
          _ref.watch(currencyListProvider).currencyList.map((e) => e.toJson()))
    };
    try {
      // final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      // _ref.watch(firebaseServiceProvider).saveCurrencyFile(map, currentDate);
      _ref.watch(firebaseServiceProvider).saveTemplateFile(map);
      _isEdit = false;
      _isSave = false;
      _ref.read(currencyListProvider).setCurrencyDone(true);
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void onEdit() {
    _isEdit = true;
    _isSave = true;
    notifyListeners();
  }

  void _updateSave(bool value) {
    _isSave = value;
    notifyListeners();
  }
}
