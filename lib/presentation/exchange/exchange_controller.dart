import 'dart:convert';

import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:currency_exchange/services/firebase_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ExchangeController with ChangeNotifier {
  final FirebaseService _firebaseService;
  final CurrencyListService _currencyListService;
  ExchangeController(this._firebaseService, this._currencyListService);

  bool _isSave = false;
  bool _isEdit = false;
  bool _isCurrencyLoading = false;
  bool _isCurrencySet = false;
  String _editText = '';
  List<int> _currentEdit = [0, 0, 0];

  bool get isCurrencyLoading => _isCurrencyLoading;
  bool get isSaveEnable => _isSave;
  bool get isEdit => _isEdit;
  bool get isCurrencySet => _isCurrencySet;
  String get editText => _editText;
  List<Country> get currencyList => _currencyListService.currencyList;

  Future<void> getCurrency() async {
    _isCurrencyLoading = true;
    notifyListeners();
    final currencyFile = await _getCurrencyFile();
    _currencyListService.setCurrencyList(List<Country>.from(json
        .decode(utf8.decode(currencyFile!))['country']
        .map((item) => Country.fromJson(item))));
    _currencyListService.generateBuySellList();
    final initPriceEditText = _currencyListService.currencyList.first.buyPriceRange.first.price;
    _editText = initPriceEditText != null ? initPriceEditText.toString() : '';
    _isCurrencyLoading = false;
    notifyListeners();
  }

  Future<Uint8List?> _getCurrencyFile() async {
    try {
      //   final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      //   final currencyFile =
      //       await _firebaseService.getCurrencyFile(date: currentDate);
      final currencyFile = await _firebaseService.getCurrencyFile();
      _isCurrencySet = true;
      notifyListeners();
      return currencyFile;
      // } on PlatformException catch (e) {
      //   if (e.code == 'object-not-found' ||
      //       (e.code == 'firebase_storage' &&
      //           (e.details as Map<dynamic, dynamic>)['code'] ==
      //               'object-not-found')) {
      //     _isSave = false;
      //     _isEdit = true;
      //     notifyListeners();
      //     return await _firebaseService.getCurrencyFile();
      //   }
    } catch(_) {
      throw GetCurrencyException('Something wrong with template files');
    }
  }

  void addRate(int currency, int rate, String value, PriceType type) {
    _currentEdit = [currency, rate, type.index];
    _editText = value;
    _isSave = _currencyListService.addRate(currency, rate, value, type);
    notifyListeners();
  }

  bool checkCurrentEdit(int currency, int rate, PriceType type) {
    final currentPos = [currency, rate, type.index];
    for(var i = 0;i < currentPos.length; i++) {
      if(currentPos[i] != _currentEdit[i]){
        return false;
      }
    }
    return true;
  }

  void onSave() {
    _currencyListService.updateNewCurrencyList();
    final map = {
      'country':
          List.from(_currencyListService.currencyList.map((e) => e.toJson()))
    };
    try {
      // final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      // _firebaseService.saveCurrencyFile(map, currentDate);
      _firebaseService.saveTemplateFile(map);
      _isEdit = false;
      _isSave = false;
      _isCurrencySet = true;
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
}
