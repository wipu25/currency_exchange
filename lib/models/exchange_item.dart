import 'package:currency_exchange/helpers/number_format.dart';
import 'package:currency_exchange/models/calculated_item.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_item.freezed.dart';
part 'exchange_item.g.dart';

@freezed
class ExchangeItem with _$ExchangeItem {
  const ExchangeItem._();

  const factory ExchangeItem({
    required List<PriceRange> priceRange,
    required List<CalculatedItem> calculatedItem,
    required double amountExchange,
    required double totalPrice,
    required String currency,
    required String transaction,
  }) = _ExchangeItem;

  factory ExchangeItem.fromJson(Map<String, Object?> json) =>
      _$ExchangeItemFromJson(json);

  String getTotalPrice() {
    return CustomNumberFormat.commaFormat(totalPrice);
  }

  String getAmountExchange() {
    return CustomNumberFormat.commaFormat(amountExchange);
  }
}
