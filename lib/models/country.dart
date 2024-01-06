import 'package:currency_exchange/models/price_range.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'country.freezed.dart';
part 'country.g.dart';

@freezed
class Country with _$Country {
  const factory Country(
      {required String logo,
      required String currency,
      required String countryName,
      required List<PriceRange> buyPriceRange,
      required List<PriceRange> sellPriceRange}) = _Country;
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory Country.fromJson(Map<String, Object?> json) =>
      _$CountryFromJson(json);

  @override
  bool operator ==(Object other) => other is Country && identical(other, this);

  @override
  // TODO: implement hashCode
  int get hashCode => currency.hashCode;
}
