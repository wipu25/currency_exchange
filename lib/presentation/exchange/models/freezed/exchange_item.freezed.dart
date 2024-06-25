// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../exchange_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExchangeItem _$ExchangeItemFromJson(Map<String, dynamic> json) {
  return _ExchangeItem.fromJson(json);
}

/// @nodoc
mixin _$ExchangeItem {
  List<CalculatedItem> get calculatedItem => throw _privateConstructorUsedError;
  double get amountExchange => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  Transaction get transaction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExchangeItemCopyWith<ExchangeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangeItemCopyWith<$Res> {
  factory $ExchangeItemCopyWith(
          ExchangeItem value, $Res Function(ExchangeItem) then) =
      _$ExchangeItemCopyWithImpl<$Res, ExchangeItem>;
  @useResult
  $Res call(
      {List<CalculatedItem> calculatedItem,
      double amountExchange,
      double totalPrice,
      String currency,
      Transaction transaction});
}

/// @nodoc
class _$ExchangeItemCopyWithImpl<$Res, $Val extends ExchangeItem>
    implements $ExchangeItemCopyWith<$Res> {
  _$ExchangeItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculatedItem = null,
    Object? amountExchange = null,
    Object? totalPrice = null,
    Object? currency = null,
    Object? transaction = null,
  }) {
    return _then(_value.copyWith(
      calculatedItem: null == calculatedItem
          ? _value.calculatedItem
          : calculatedItem // ignore: cast_nullable_to_non_nullable
              as List<CalculatedItem>,
      amountExchange: null == amountExchange
          ? _value.amountExchange
          : amountExchange // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExchangeItemImplCopyWith<$Res>
    implements $ExchangeItemCopyWith<$Res> {
  factory _$$ExchangeItemImplCopyWith(
          _$ExchangeItemImpl value, $Res Function(_$ExchangeItemImpl) then) =
      __$$ExchangeItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CalculatedItem> calculatedItem,
      double amountExchange,
      double totalPrice,
      String currency,
      Transaction transaction});
}

/// @nodoc
class __$$ExchangeItemImplCopyWithImpl<$Res>
    extends _$ExchangeItemCopyWithImpl<$Res, _$ExchangeItemImpl>
    implements _$$ExchangeItemImplCopyWith<$Res> {
  __$$ExchangeItemImplCopyWithImpl(
      _$ExchangeItemImpl _value, $Res Function(_$ExchangeItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculatedItem = null,
    Object? amountExchange = null,
    Object? totalPrice = null,
    Object? currency = null,
    Object? transaction = null,
  }) {
    return _then(_$ExchangeItemImpl(
      calculatedItem: null == calculatedItem
          ? _value._calculatedItem
          : calculatedItem // ignore: cast_nullable_to_non_nullable
              as List<CalculatedItem>,
      amountExchange: null == amountExchange
          ? _value.amountExchange
          : amountExchange // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExchangeItemImpl extends _ExchangeItem {
  const _$ExchangeItemImpl(
      {required final List<CalculatedItem> calculatedItem,
      required this.amountExchange,
      required this.totalPrice,
      required this.currency,
      required this.transaction})
      : _calculatedItem = calculatedItem,
        super._();

  factory _$ExchangeItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExchangeItemImplFromJson(json);

  final List<CalculatedItem> _calculatedItem;
  @override
  List<CalculatedItem> get calculatedItem {
    if (_calculatedItem is EqualUnmodifiableListView) return _calculatedItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calculatedItem);
  }

  @override
  final double amountExchange;
  @override
  final double totalPrice;
  @override
  final String currency;
  @override
  final Transaction transaction;

  @override
  String toString() {
    return 'ExchangeItem(calculatedItem: $calculatedItem, amountExchange: $amountExchange, totalPrice: $totalPrice, currency: $currency, transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeItemImpl &&
            const DeepCollectionEquality()
                .equals(other._calculatedItem, _calculatedItem) &&
            (identical(other.amountExchange, amountExchange) ||
                other.amountExchange == amountExchange) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_calculatedItem),
      amountExchange,
      totalPrice,
      currency,
      transaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeItemImplCopyWith<_$ExchangeItemImpl> get copyWith =>
      __$$ExchangeItemImplCopyWithImpl<_$ExchangeItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExchangeItemImplToJson(
      this,
    );
  }
}

abstract class _ExchangeItem extends ExchangeItem {
  const factory _ExchangeItem(
      {required final List<CalculatedItem> calculatedItem,
      required final double amountExchange,
      required final double totalPrice,
      required final String currency,
      required final Transaction transaction}) = _$ExchangeItemImpl;
  const _ExchangeItem._() : super._();

  factory _ExchangeItem.fromJson(Map<String, dynamic> json) =
      _$ExchangeItemImpl.fromJson;

  @override
  List<CalculatedItem> get calculatedItem;
  @override
  double get amountExchange;
  @override
  double get totalPrice;
  @override
  String get currency;
  @override
  Transaction get transaction;
  @override
  @JsonKey(ignore: true)
  _$$ExchangeItemImplCopyWith<_$ExchangeItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
