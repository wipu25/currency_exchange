// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculated_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalculatedItem _$CalculatedItemFromJson(Map<String, dynamic> json) {
  return _CalculatedItem.fromJson(json);
}

/// @nodoc
mixin _$CalculatedItem {
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
  $Res call({double amount, double price});
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
    Object? amount = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
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
}

/// @nodoc
abstract class _$$_CalculatedItemCopyWith<$Res>
    implements $CalculatedItemCopyWith<$Res> {
  factory _$$_CalculatedItemCopyWith(
          _$_CalculatedItem value, $Res Function(_$_CalculatedItem) then) =
      __$$_CalculatedItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, double price});
}

/// @nodoc
class __$$_CalculatedItemCopyWithImpl<$Res>
    extends _$CalculatedItemCopyWithImpl<$Res, _$_CalculatedItem>
    implements _$$_CalculatedItemCopyWith<$Res> {
  __$$_CalculatedItemCopyWithImpl(
      _$_CalculatedItem _value, $Res Function(_$_CalculatedItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? price = null,
  }) {
    return _then(_$_CalculatedItem(
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
class _$_CalculatedItem extends _CalculatedItem {
  const _$_CalculatedItem({required this.amount, required this.price})
      : super._();

  factory _$_CalculatedItem.fromJson(Map<String, dynamic> json) =>
      _$$_CalculatedItemFromJson(json);

  @override
  final double amount;
  @override
  final double price;

  @override
  String toString() {
    return 'CalculatedItem(amount: $amount, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalculatedItem &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalculatedItemCopyWith<_$_CalculatedItem> get copyWith =>
      __$$_CalculatedItemCopyWithImpl<_$_CalculatedItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CalculatedItemToJson(
      this,
    );
  }
}

abstract class _CalculatedItem extends CalculatedItem {
  const factory _CalculatedItem(
      {required final double amount,
      required final double price}) = _$_CalculatedItem;
  const _CalculatedItem._() : super._();

  factory _CalculatedItem.fromJson(Map<String, dynamic> json) =
      _$_CalculatedItem.fromJson;

  @override
  double get amount;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$_CalculatedItemCopyWith<_$_CalculatedItem> get copyWith =>
      throw _privateConstructorUsedError;
}
