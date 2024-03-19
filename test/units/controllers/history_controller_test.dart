import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/presentation/history/history_controller.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:currency_exchange/services/firebase_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'history_controller_test.mocks.dart';

@GenerateNiceMocks(
    [MockSpec<FirebaseService>(), MockSpec<CurrencyListService>()])
void main() {
  late HistoryController historyController;
  final mockFirebaseService = MockFirebaseService();
  final mockCurrencyListService = MockCurrencyListService();

  void mockGetTransactionFile(DateTime datetime, String result) {
    final formatDateTime = DateFormat('yyyy-MM-dd').format(datetime);
    when(mockFirebaseService.getTransactionFile(formatDateTime))
        .thenAnswer((_) async {
      return Uint8List.fromList(result.codeUnits);
    });
  }

  setUpAll(() {
    historyController =
        HistoryController(mockFirebaseService, mockCurrencyListService);
    const data =
        '{"transaction":[{"calculatedItem":[{"priceRange":[{"min":50.0,"max":100.0,"price":24.0}],"calculatedItem":[{"amount":1.0,"price":24.0}],"amountExchange":1.0,"totalPrice":24.0,"currency":"USD","transaction":"buy"}],"dateTime":"2023-12-30_23:54:58","paymentMethod":"cash"}]}';
    mockGetTransactionFile(DateTime.now(), data);
  });

  test('Verify init controller', () async {
    await historyController.init();
    expect(
        historyController.historyList.first.paymentMethod, PaymentMethod.cash);
    expect(
        historyController.historyList.first.calculatedItem.first.amountExchange,
        1.0);
  });

  test('Verify select date time', () async {
    final dateTime = DateTime.now().subtract(const Duration(days: 1));
    const emptyData = '{"transaction":[]}';
    mockGetTransactionFile(dateTime, emptyData);

    await historyController.selectDateTime(dateTime);
    expect(historyController.dateTimeDisplay, dateTime);
    expect(historyController.historyList, []);
  });

  test('Verify Error file not found', () async {
    final dateTime = DateTime.now();
    final formatDateTime = DateFormat('yyyy-MM-dd').format(dateTime);

    when(mockFirebaseService.getTransactionFile(formatDateTime))
        .thenAnswer((_) async {
      throw PlatformException(code: 'object-not-found');
    });

    await historyController.selectDateTime(dateTime);
    expect(historyController.historyList, []);
    expect(historyController.dateTimeDisplay, dateTime);
  });
}
