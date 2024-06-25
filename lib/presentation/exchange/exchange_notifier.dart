import 'dart:convert';

import 'package:currency_exchange/helpers/number_format.dart';
import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/presentation/calculate/models/exchange_screen_state.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:currency_exchange/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exchangeNotifier = AsyncNotifierProvider<ExchangeNotifier, ExchangeState>(
    ExchangeNotifier.new);

class ExchangeNotifier extends AsyncNotifier<ExchangeState> {
  @override
  ExchangeState build() => ExchangeState.disable;

  Future<void> getCurrency() async {
    try {
      state = const AsyncValue.loading();
      final currencyFile = await ref.read(firebaseProvider).getCurrencyFile();
      final isNullItem = ref.read(currencyListProvider).generateBuySellList(
          List<Country>.from(json
              .decode(utf8.decode(currencyFile!))['country']
              .map((item) => Country.fromJson(item))));
      state =
          AsyncData(isNullItem ? ExchangeState.disable : ExchangeState.save);
      ref.read(currencyListProvider).setCurrencyDone(true);
    } catch (e, stackTrace) {
      state = AsyncError(
          GetCurrencyException('Something wrong with template files'),
          stackTrace);
    }
  }

  void onEdit() {
    state = const AsyncValue.data(ExchangeState.save);
  }

  void addRate(int currency, int rate, String value, PriceType type) {
    var formatValue = value;
    String? errorMsg;
    try {
      if (value.isNotEmpty) {
        final numValue = value.replaceAll(',', '');
        final splitDecimal = numValue.split('.');
        formatValue = CustomNumberFormat.fieldFormat(splitDecimal[0]) +
            (splitDecimal.length > 1 ? '.${splitDecimal[1]}' : '');
      }
      errorMsg = ref
          .watch(currencyListProvider)
          .addRate(currency, rate, formatValue, type);
      if (errorMsg == null) {
        state = const AsyncValue.data(ExchangeState.save);
        return;
      }
    } catch (e) {
      errorMsg = (e as CalculateException).message;
    }
    state = const AsyncValue.data(ExchangeState.disable);
    throw CalculateException(errorMsg);
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
      state = const AsyncValue.data(ExchangeState.edit);
      ref.read(currencyListProvider).setCurrencyDone(true);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
