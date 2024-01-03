import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculated_item.freezed.dart';
part 'calculated_item.g.dart';

@freezed
class CalculatedItem with _$CalculatedItem {
  const factory CalculatedItem(
      {required double amount, required double price}) = _CalculatedItem;

  factory CalculatedItem.fromJson(Map<String, Object?> json) =>
      _$CalculatedItemFromJson(json);
}
