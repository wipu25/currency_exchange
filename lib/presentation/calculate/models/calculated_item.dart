import 'package:currency_exchange/helpers/number_format.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/calculated_item.freezed.dart';
part 'freezed/calculated_item.g.dart';

@freezed
class CalculatedItem with _$CalculatedItem {
  const CalculatedItem._();

  const factory CalculatedItem(
      {PriceRange? priceRange,
      required double amount,
      required double price}) = _CalculatedItem;

  factory CalculatedItem.fromJson(Map<String, Object?> json) =>
      _$CalculatedItemFromJson(json);

  String getAmount() {
    return CustomNumberFormat.commaFormat(amount);
  }

  String getPrice() {
    return CustomNumberFormat.commaFormat(price);
  }
}
