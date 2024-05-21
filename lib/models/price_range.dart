import 'package:currency_exchange/helpers/number_format.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/price_range.freezed.dart';
part 'freezed/price_range.g.dart';

@freezed
class PriceRange with _$PriceRange {
  const PriceRange._();

  const factory PriceRange({double? min, double? max, double? price}) =
      _PriceRange;
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory PriceRange.fromJson(Map<String, Object?> json) =>
      _$PriceRangeFromJson(json);

  String getRange() {
    var minStr = CustomNumberFormat.commaFormat(min ?? 0.0);
    var maxStr = CustomNumberFormat.commaFormat(max ?? 0.0);
    var hyphen = '-';
    if (min == null) {
      minStr = '0.0';
      if (max != null) {
        minStr = '';
        hyphen = '';
      }
    }
    if (max == null) {
      maxStr = '~';
    }
    return '$minStr $hyphen $maxStr';
  }

  String getPrice() {
    return CustomNumberFormat.commaFormat(price);
  }
}

enum PriceType { buy, sell }
