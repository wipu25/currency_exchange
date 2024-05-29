
import 'dart:convert';

import 'package:currency_exchange/helpers/number_format.dart';
import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/presentation/calculate/models/exchange_screen_state.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:currency_exchange/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exchangeNotifier = NotifierProvider<ExchangeNotifier, ExchangeScreenState>(ExchangeNotifier.new);

class ExchangeNotifier extends Notifier<ExchangeScreenState> {
  @override
  ExchangeScreenState build() => const ExchangeScreenState(isSave: false, isEdit: false, isCurrencyLoading: false);

  void onEdit() {
    state = state.copyWith(isEdit: true,isSave: true);
  }

  void _updateSave(bool value) {
    state = state.copyWith(isSave: value);
  }

  Future<void> getCurrency() async {
    state = state.copyWith(isCurrencyLoading: true);
    final currencyFile = await _getCurrencyFile();
    state = state.copyWith(isCurrencyLoading: false, isEdit: true, isSave: !ref.read(currencyListProvider).generateBuySellList(
        List<Country>.from(json
            .decode(utf8.decode(currencyFile!))['country']
            .map((item) => Country.fromJson(item)))));
  }

  Future<Uint8List?> _getCurrencyFile() async {
    try {
      //   final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      //   final currencyFile =
      //       await ref.watch(firebaseServiceProvider).getCurrencyFile(date: currentDate);
      final currencyFile = await ref.read(firebaseProvider).getCurrencyFile();
      ref.read(currencyListProvider).setCurrencyDone(true);
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
      //     return await ref.watch(firebaseServiceProvider).getCurrencyFile();
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
    final result = ref
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
    ref.watch(currencyListProvider).updateNewCurrencyList();
    final map = {
      'country': List.from(
          ref.watch(currencyListProvider).currencyList.map((e) => e.toJson()))
    };
    try {
      // final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      // ref.watch(firebaseServiceProvider).saveCurrencyFile(map, currentDate);
      ref.watch(firebaseProvider).saveTemplateFile(map);
      state = state.copyWith(isEdit: false,isSave: false);
      ref.read(currencyListProvider).setCurrencyDone(true);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

}