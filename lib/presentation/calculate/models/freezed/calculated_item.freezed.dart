// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../calculated_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalculatedItem _$CalculatedItemFromJson(Map<String, dynamic> json) {
  return _CalculatedItem.fromJson(json);
}

/// @nodoc
mixin _$CalculatedItem {
  PriceRange? get priceRange => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalculatedItemCopyWith<CalculatedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatedItemCopyWith<$Res> {
  factory $CalculatedItemCopyWith(
          CalculatedItem value, $Res Function(CalculatedItem) then) =
      _$CalculatedItemCopyWithImpl<$Res, CalculatedItem>;
  @useResult
  $Res call({PriceRange? priceRange, double amount, double price});

  $PriceRangeCopyWith<$Res>? get priceRange;
}

/// @nodoc
class _$CalculatedItemCopyWithImpl<$Res, $Val extends CalculatedItem>
    implements $CalculatedItemCopyWith<$Res> {
  _$CalculatedItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceRange = freezed,
    Object? amount = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      priceRange: freezed == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as PriceRange?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceRangeCopyWith<$Res>? get priceRange {
    if (_value.priceRange == null) {
      return null;
    }

    return $PriceRangeCopyWith<$Res>(_value.priceRange!, (value) {
      return _then(_value.copyWith(priceRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CalculatedItemImplCopyWith<$Res>
    implements $CalculatedItemCopyWith<$Res> {
  factory _$$CalculatedItemImplCopyWith(_$CalculatedItemImpl value,
          $Res Function(_$CalculatedItemImpl) then) =
      __$$CalculatedItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PriceRange? priceRange, double amount, double price});

  @override
  $PriceRangeCopyWith<$Res>? get priceRange;
}

/// @nodoc
class __$$CalculatedItemImplCopyWithImpl<$Res>
    extends _$CalculatedItemCopyWithImpl<$Res, _$CalculatedItemImpl>
    implements _$$CalculatedItemImplCopyWith<$Res> {
  __$$CalculatedItemImplCopyWithImpl(
      _$CalculatedItemImpl _value, $Res Function(_$CalculatedItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceRange = freezed,
    Object? amount = null,
    Object? price = null,
  }) {
    return _then(_$CalculatedItemImpl(
      priceRange: freezed == priceRange
          ? _value.priceRange
          : priceRange // ignore: cast_nullable_to_non_nullable
              as PriceRange?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalculatedItemImpl extends _CalculatedItem {
  const _$CalculatedItemImpl(
      {this.priceRange, required this.amount, required this.price})
      : super._();

  factory _$CalculatedItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalculatedItemImplFromJson(json);

  @override
  final PriceRange? priceRange;
  @override
  final double amount;
  @override
  final double price;

  @override
  String toString() {
    return 'CalculatedItem(priceRange: $priceRange, amount: $amount, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculatedItemImpl &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, priceRange, amount, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculatedItemImplCopyWith<_$CalculatedItemImpl> get copyWith =>
      __$$CalculatedItemImplCopyWithImpl<_$CalculatedItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalculatedItemImplToJson(
      this,
    );
  }
}

abstract class _CalculatedItem extends CalculatedItem {
  const factory _CalculatedItem(
      {final PriceRange? priceRange,
      required final double amount,
      required final double price}) = _$CalculatedItemImpl;
  const _CalculatedItem._() : super._();

  factory _CalculatedItem.fromJson(Map<String, dynamic> json) =
      _$CalculatedItemImpl.fromJson;

  @override
  PriceRange? get priceRange;
  @override
  double get amount;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$CalculatedItemImplCopyWith<_$CalculatedItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
