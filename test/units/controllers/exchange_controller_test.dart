import 'dart:convert';

import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/presentation/exchange/exchange_controller.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:currency_exchange/services/firebase_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'exchange_controller_test.mocks.dart';

@GenerateNiceMocks(
    [MockSpec<FirebaseService>(), MockSpec<CurrencyListService>()])
void main() {
  late ExchangeController exchangeController;
  final mockFirebaseService = MockFirebaseService();
  final mockCurrencyListService = MockCurrencyListService();

  setUpAll(() {
    exchangeController =
        ExchangeController(mockFirebaseService, mockCurrencyListService);
  });

  test('Verify get currency', () async {
    final result = utf8.encode('''{
        "country": 
            [{"logo": "",
              "currency": "RMB","countryName": "china",
              "buyPriceRange": [],"sellPriceRange": []}
            ]}''');
    when(mockFirebaseService.getCurrencyFile()).thenAnswer((_) async => result);
    when(mockCurrencyListService.setCurrencyList(List<Country>.from(json
        .decode(utf8.decode(result))['country']
        .map((item) => Country.fromJson(item))))).thenAnswer((_) => []);
    when(mockCurrencyListService.generateBuySellList())
        .thenAnswer((_) => false);

    await exchangeController.getCurrency();
    expect(exchangeController.isEdit, true);
    expect(exchangeController.isSaveEnable, true);
    expect(exchangeController.isCurrencyLoading, false);
  });

  test('Verify add rate', () {
    when(mockCurrencyListService.addRate(1, 1, 'value', PriceType.sell))
        .thenAnswer((_) => null);
    exchangeController.addRate(1, 1, 'value', PriceType.sell);

    expect(exchangeController.isSaveEnable, true);
  });

  test('Verify add rate invalid', () {
    when(mockCurrencyListService.addRate(1, 1, 'value', PriceType.sell))
        .thenAnswer((_) => 'smth');
    expect(() => exchangeController.addRate(1, 1, 'value', PriceType.sell),
        throwsA(isA<CalculateException>()));

    expect(exchangeController.isSaveEnable, false);
  });

  test('Verify on save', () {
    when(mockCurrencyListService.updateNewCurrencyList()).thenAnswer((_) {});
    when(mockCurrencyListService.currencyList).thenAnswer((_) => []);
    when(mockFirebaseService.saveTemplateFile({'country': []}));

    exchangeController.onSave();

    expect(exchangeController.isEdit, false);
    expect(exchangeController.isSaveEnable, false);
    expect(exchangeController.isCurrencySet, true);
  });

  test('Verify on Edit', () {
    exchangeController.onEdit();
    expect(exchangeController.isSaveEnable, true);
    expect(exchangeController.isEdit, true);
  });
}
