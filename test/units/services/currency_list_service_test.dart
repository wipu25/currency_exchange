import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CurrencyListService currencyListService;
  const countryData = Country(
      logo: 'logo',
      currency: 'currency',
      countryName: 'countryName',
      buyPriceRange: [],
      sellPriceRange: []);

  setUpAll(() {
    currencyListService = CurrencyListService();
  });

  test('Verify set currency list', () {
    currencyListService.setCurrencyList([countryData]);
    expect(currencyListService.currencyList, [countryData]);
  });

  test('Verify add rate', () {
    final result1 = currencyListService.addRate(1, 1, '', PriceType.buy);
    expect(result1, false);
    final result2 = currencyListService.addRate(1, 1, '-1', PriceType.buy);
    expect(result2, false);
  });
}
