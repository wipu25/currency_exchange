// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../country.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
mixin _$Country {
  String get logo => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get countryName => throw _privateConstructorUsedError;
  List<PriceRange> get buyPriceRange => throw _privateConstructorUsedError;
  List<PriceRange> get sellPriceRange => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call(
      {String logo,
      String currency,
      String countryName,
      List<PriceRange> buyPriceRange,
      List<PriceRange> sellPriceRange});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logo = null,
    Object? currency = null,
    Object? countryName = null,
    Object? buyPriceRange = null,
    Object? sellPriceRange = null,
  }) {
    return _then(_value.copyWith(
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      buyPriceRange: null == buyPriceRange
          ? _value.buyPriceRange
          : buyPriceRange // ignore: cast_nullable_to_non_nullable
              as List<PriceRange>,
      sellPriceRange: null == sellPriceRange
          ? _value.sellPriceRange
          : sellPriceRange // ignore: cast_nullable_to_non_nullable
              as List<PriceRange>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryImplCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$CountryImplCopyWith(
          _$CountryImpl value, $Res Function(_$CountryImpl) then) =
      __$$CountryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String logo,
      String currency,
      String countryName,
      List<PriceRange> buyPriceRange,
      List<PriceRange> sellPriceRange});
}

/// @nodoc
class __$$CountryImplCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$CountryImpl>
    implements _$$CountryImplCopyWith<$Res> {
  __$$CountryImplCopyWithImpl(
      _$CountryImpl _value, $Res Function(_$CountryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logo = null,
    Object? currency = null,
    Object? countryName = null,
    Object? buyPriceRange = null,
    Object? sellPriceRange = null,
  }) {
    return _then(_$CountryImpl(
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      buyPriceRange: null == buyPriceRange
          ? _value._buyPriceRange
          : buyPriceRange // ignore: cast_nullable_to_non_nullable
              as List<PriceRange>,
      sellPriceRange: null == sellPriceRange
          ? _value._sellPriceRange
          : sellPriceRange // ignore: cast_nullable_to_non_nullable
              as List<PriceRange>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryImpl implements _Country {
  const _$CountryImpl(
      {required this.logo,
      required this.currency,
      required this.countryName,
      required final List<PriceRange> buyPriceRange,
      required final List<PriceRange> sellPriceRange})
      : _buyPriceRange = buyPriceRange,
        _sellPriceRange = sellPriceRange;

  factory _$CountryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryImplFromJson(json);

  @override
  final String logo;
  @override
  final String currency;
  @override
  final String countryName;
  final List<PriceRange> _buyPriceRange;
  @override
  List<PriceRange> get buyPriceRange {
    if (_buyPriceRange is EqualUnmodifiableListView) return _buyPriceRange;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_buyPriceRange);
  }

  final List<PriceRange> _sellPriceRange;
  @override
  List<PriceRange> get sellPriceRange {
    if (_sellPriceRange is EqualUnmodifiableListView) return _sellPriceRange;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sellPriceRange);
  }

  @override
  String toString() {
    return 'Country(logo: $logo, currency: $currency, countryName: $countryName, buyPriceRange: $buyPriceRange, sellPriceRange: $sellPriceRange)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      __$$CountryImplCopyWithImpl<_$CountryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryImplToJson(
      this,
    );
  }
}

abstract class _Country implements Country {
  const factory _Country(
      {required final String logo,
      required final String currency,
      required final String countryName,
      required final List<PriceRange> buyPriceRange,
      required final List<PriceRange> sellPriceRange}) = _$CountryImpl;

  factory _Country.fromJson(Map<String, dynamic> json) = _$CountryImpl.fromJson;

  @override
  String get logo;
  @override
  String get currency;
  @override
  String get countryName;
  @override
  List<PriceRange> get buyPriceRange;
  @override
  List<PriceRange> get sellPriceRange;
  @override
  @JsonKey(ignore: true)
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
