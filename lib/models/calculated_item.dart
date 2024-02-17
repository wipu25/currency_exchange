import 'package:currency_exchange/helpers/number_format.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculated_item.freezed.dart';
part 'calculated_item.g.dart';

@freezed
class CalculatedItem with _$CalculatedItem {
  const CalculatedItem._();

  const factory CalculatedItem(
      {required double amount, required double price}) = _CalculatedItem;

  factory CalculatedItem.fromJson(Map<String, Object?> json) =>
      _$CalculatedItemFromJson(json);

  String getAmount() {
    return CustomNumberFormat.commaFormat(amount);
  }

  String getPrice() {
    return CustomNumberFormat.commaFormat(price);
  }
}
