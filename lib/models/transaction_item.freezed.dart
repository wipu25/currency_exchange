// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionItem _$TransactionItemFromJson(Map<String, dynamic> json) {
  return _TransactionItem.fromJson(json);
}

/// @nodoc
mixin _$TransactionItem {
  List<ExchangeItem> get calculatedItem =>
      throw _privateConstructorUsedError; //due to order transaction is not yet implemented total value
  double? get totalBuyPrice => throw _privateConstructorUsedError;
  double? get totalSellPrice => throw _privateConstructorUsedError;
  String get dateTime => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  ClientInfo? get clientInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionItemCopyWith<TransactionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionItemCopyWith<$Res> {
  factory $TransactionItemCopyWith(
          TransactionItem value, $Res Function(TransactionItem) then) =
      _$TransactionItemCopyWithImpl<$Res, TransactionItem>;
  @useResult
  $Res call(
      {List<ExchangeItem> calculatedItem,
      double? totalBuyPrice,
      double? totalSellPrice,
      String dateTime,
      PaymentMethod paymentMethod,
      ClientInfo? clientInfo});

  $ClientInfoCopyWith<$Res>? get clientInfo;
}

/// @nodoc
class _$TransactionItemCopyWithImpl<$Res, $Val extends TransactionItem>
    implements $TransactionItemCopyWith<$Res> {
  _$TransactionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculatedItem = null,
    Object? totalBuyPrice = freezed,
    Object? totalSellPrice = freezed,
    Object? dateTime = null,
    Object? paymentMethod = null,
    Object? clientInfo = freezed,
  }) {
    return _then(_value.copyWith(
      calculatedItem: null == calculatedItem
          ? _value.calculatedItem
          : calculatedItem // ignore: cast_nullable_to_non_nullable
              as List<ExchangeItem>,
      totalBuyPrice: freezed == totalBuyPrice
          ? _value.totalBuyPrice
          : totalBuyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSellPrice: freezed == totalSellPrice
          ? _value.totalSellPrice
          : totalSellPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      clientInfo: freezed == clientInfo
          ? _value.clientInfo
          : clientInfo // ignore: cast_nullable_to_non_nullable
              as ClientInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientInfoCopyWith<$Res>? get clientInfo {
    if (_value.clientInfo == null) {
      return null;
    }

    return $ClientInfoCopyWith<$Res>(_value.clientInfo!, (value) {
      return _then(_value.copyWith(clientInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionItemCopyWith<$Res>
    implements $TransactionItemCopyWith<$Res> {
  factory _$$_TransactionItemCopyWith(
          _$_TransactionItem value, $Res Function(_$_TransactionItem) then) =
      __$$_TransactionItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ExchangeItem> calculatedItem,
      double? totalBuyPrice,
      double? totalSellPrice,
      String dateTime,
      PaymentMethod paymentMethod,
      ClientInfo? clientInfo});

  @override
  $ClientInfoCopyWith<$Res>? get clientInfo;
}

/// @nodoc
class __$$_TransactionItemCopyWithImpl<$Res>
    extends _$TransactionItemCopyWithImpl<$Res, _$_TransactionItem>
    implements _$$_TransactionItemCopyWith<$Res> {
  __$$_TransactionItemCopyWithImpl(
      _$_TransactionItem _value, $Res Function(_$_TransactionItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculatedItem = null,
    Object? totalBuyPrice = freezed,
    Object? totalSellPrice = freezed,
    Object? dateTime = null,
    Object? paymentMethod = null,
    Object? clientInfo = freezed,
  }) {
    return _then(_$_TransactionItem(
      calculatedItem: null == calculatedItem
          ? _value._calculatedItem
          : calculatedItem // ignore: cast_nullable_to_non_nullable
              as List<ExchangeItem>,
      totalBuyPrice: freezed == totalBuyPrice
          ? _value.totalBuyPrice
          : totalBuyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSellPrice: freezed == totalSellPrice
          ? _value.totalSellPrice
          : totalSellPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      clientInfo: freezed == clientInfo
          ? _value.clientInfo
          : clientInfo // ignore: cast_nullable_to_non_nullable
              as ClientInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionItem extends _TransactionItem {
  const _$_TransactionItem(
      {required final List<ExchangeItem> calculatedItem,
      this.totalBuyPrice,
      this.totalSellPrice,
      required this.dateTime,
      required this.paymentMethod,
      this.clientInfo})
      : _calculatedItem = calculatedItem,
        super._();

  factory _$_TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionItemFromJson(json);

  final List<ExchangeItem> _calculatedItem;
  @override
  List<ExchangeItem> get calculatedItem {
    if (_calculatedItem is EqualUnmodifiableListView) return _calculatedItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calculatedItem);
  }

//due to order transaction is not yet implemented total value
  @override
  final double? totalBuyPrice;
  @override
  final double? totalSellPrice;
  @override
  final String dateTime;
  @override
  final PaymentMethod paymentMethod;
  @override
  final ClientInfo? clientInfo;

  @override
  String toString() {
    return 'TransactionItem(calculatedItem: $calculatedItem, totalBuyPrice: $totalBuyPrice, totalSellPrice: $totalSellPrice, dateTime: $dateTime, paymentMethod: $paymentMethod, clientInfo: $clientInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionItem &&
            const DeepCollectionEquality()
                .equals(other._calculatedItem, _calculatedItem) &&
            (identical(other.totalBuyPrice, totalBuyPrice) ||
                other.totalBuyPrice == totalBuyPrice) &&
            (identical(other.totalSellPrice, totalSellPrice) ||
                other.totalSellPrice == totalSellPrice) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.clientInfo, clientInfo) ||
                other.clientInfo == clientInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_calculatedItem),
      totalBuyPrice,
      totalSellPrice,
      dateTime,
      paymentMethod,
      clientInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionItemCopyWith<_$_TransactionItem> get copyWith =>
      __$$_TransactionItemCopyWithImpl<_$_TransactionItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionItemToJson(
      this,
    );
  }
}

abstract class _TransactionItem extends TransactionItem {
  const factory _TransactionItem(
      {required final List<ExchangeItem> calculatedItem,
      final double? totalBuyPrice,
      final double? totalSellPrice,
      required final String dateTime,
      required final PaymentMethod paymentMethod,
      final ClientInfo? clientInfo}) = _$_TransactionItem;
  const _TransactionItem._() : super._();

  factory _TransactionItem.fromJson(Map<String, dynamic> json) =
      _$_TransactionItem.fromJson;

  @override
  List<ExchangeItem> get calculatedItem;
  @override //due to order transaction is not yet implemented total value
  double? get totalBuyPrice;
  @override
  double? get totalSellPrice;
  @override
  String get dateTime;
  @override
  PaymentMethod get paymentMethod;
  @override
  ClientInfo? get clientInfo;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionItemCopyWith<_$_TransactionItem> get copyWith =>
      throw _privateConstructorUsedError;
}
