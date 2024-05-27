// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../price_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceRange _$PriceRangeFromJson(Map<String, dynamic> json) {
  return _PriceRange.fromJson(json);
}

/// @nodoc
mixin _$PriceRange {
  double? get min => throw _privateConstructorUsedError;
  double? get max => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceRangeCopyWith<PriceRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceRangeCopyWith<$Res> {
  factory $PriceRangeCopyWith(
          PriceRange value, $Res Function(PriceRange) then) =
      _$PriceRangeCopyWithImpl<$Res, PriceRange>;
  @useResult
  $Res call({double? min, double? max, double? price});
}

/// @nodoc
class _$PriceRangeCopyWithImpl<$Res, $Val extends PriceRange>
    implements $PriceRangeCopyWith<$Res> {
  _$PriceRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceRangeCopyWith<$Res>
    implements $PriceRangeCopyWith<$Res> {
  factory _$$_PriceRangeCopyWith(
          _$_PriceRange value, $Res Function(_$_PriceRange) then) =
      __$$_PriceRangeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? min, double? max, double? price});
}

/// @nodoc
class __$$_PriceRangeCopyWithImpl<$Res>
    extends _$PriceRangeCopyWithImpl<$Res, _$_PriceRange>
    implements _$$_PriceRangeCopyWith<$Res> {
  __$$_PriceRangeCopyWithImpl(
      _$_PriceRange _value, $Res Function(_$_PriceRange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_PriceRange(
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PriceRange extends _PriceRange {
  const _$_PriceRange({this.min, this.max, this.price}) : super._();

  factory _$_PriceRange.fromJson(Map<String, dynamic> json) =>
      _$$_PriceRangeFromJson(json);

  @override
  final double? min;
  @override
  final double? max;
  @override
  final double? price;

  @override
  String toString() {
    return 'PriceRange(min: $min, max: $max, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceRange &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, min, max, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceRangeCopyWith<_$_PriceRange> get copyWith =>
      __$$_PriceRangeCopyWithImpl<_$_PriceRange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceRangeToJson(
      this,
    );
  }
}

abstract class _PriceRange extends PriceRange {
  const factory _PriceRange(
      {final double? min,
      final double? max,
      final double? price}) = _$_PriceRange;
  const _PriceRange._() : super._();

  factory _PriceRange.fromJson(Map<String, dynamic> json) =
      _$_PriceRange.fromJson;

  @override
  double? get min;
  @override
  double? get max;
  @override
  double? get price;
  @override
  @JsonKey(ignore: true)
  _$$_PriceRangeCopyWith<_$_PriceRange> get copyWith =>
      throw _privateConstructorUsedError;
}
