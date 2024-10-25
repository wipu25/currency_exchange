import 'package:thanarak_exchange/helpers/number_format.dart';
import 'package:thanarak_exchange/models/price_range.dart';
import 'package:thanarak_exchange/models/receipt.dart';
import 'package:thanarak_exchange/presentation/calculate/models/calculated_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/exchange_item.freezed.dart';
part 'freezed/exchange_item.g.dart';

@freezed
class ExchangeItem with _$ExchangeItem {
  const ExchangeItem._();

  const factory ExchangeItem({
    required List<CalculatedItem> calculatedItem,
    List<PriceRange>? priceRange,
    required double amountExchange,
    required double totalPrice,
    required String currency,
    required Transaction transaction,
  }) = _ExchangeItem;

  factory ExchangeItem.fromJson(Map<String, Object?> json) =>
      _$ExchangeItemFromJson(json);

  String getTotalPrice() {
    return CustomNumberFormat.commaFormat1(totalPrice);
  }

  String getAmountExchange() {
    return CustomNumberFormat.commaFormat4(amountExchange);
  }
}
