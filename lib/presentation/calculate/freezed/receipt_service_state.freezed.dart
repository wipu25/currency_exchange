// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../receipt_service_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiptServiceState _$ReceiptServiceStateFromJson(Map<String, dynamic> json) {
  return _ReceiptServiceState.fromJson(json);
}

/// @nodoc
mixin _$ReceiptServiceState {
  TransactionItem? get currentTransaction => throw _privateConstructorUsedError;
  double get totalItemAmount => throw _privateConstructorUsedError;
  double get totalItemPrice => throw _privateConstructorUsedError;
  double get totalBuyPrice => throw _privateConstructorUsedError;
  double get totalSellPrice => throw _privateConstructorUsedError;
  int get sellTransactionCount => throw _privateConstructorUsedError;
  List<ExchangeItem> get currencyItem => throw _privateConstructorUsedError;
  Transaction get transaction => throw _privateConstructorUsedError;
  PaymentMethod get payment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiptServiceStateCopyWith<ReceiptServiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptServiceStateCopyWith<$Res> {
  factory $ReceiptServiceStateCopyWith(
          ReceiptServiceState value, $Res Function(ReceiptServiceState) then) =
      _$ReceiptServiceStateCopyWithImpl<$Res, ReceiptServiceState>;
  @useResult
  $Res call(
      {TransactionItem? currentTransaction,
      double totalItemAmount,
      double totalItemPrice,
      double totalBuyPrice,
      double totalSellPrice,
      int sellTransactionCount,
      List<ExchangeItem> currencyItem,
      Transaction transaction,
      PaymentMethod payment});

  $TransactionItemCopyWith<$Res>? get currentTransaction;
}

/// @nodoc
class _$ReceiptServiceStateCopyWithImpl<$Res, $Val extends ReceiptServiceState>
    implements $ReceiptServiceStateCopyWith<$Res> {
  _$ReceiptServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTransaction = freezed,
    Object? totalItemAmount = null,
    Object? totalItemPrice = null,
    Object? totalBuyPrice = null,
    Object? totalSellPrice = null,
    Object? sellTransactionCount = null,
    Object? currencyItem = null,
    Object? transaction = null,
    Object? payment = null,
  }) {
    return _then(_value.copyWith(
      currentTransaction: freezed == currentTransaction
          ? _value.currentTransaction
          : currentTransaction // ignore: cast_nullable_to_non_nullable
              as TransactionItem?,
      totalItemAmount: null == totalItemAmount
          ? _value.totalItemAmount
          : totalItemAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalItemPrice: null == totalItemPrice
          ? _value.totalItemPrice
          : totalItemPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalBuyPrice: null == totalBuyPrice
          ? _value.totalBuyPrice
          : totalBuyPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalSellPrice: null == totalSellPrice
          ? _value.totalSellPrice
          : totalSellPrice // ignore: cast_nullable_to_non_nullable
              as double,
      sellTransactionCount: null == sellTransactionCount
          ? _value.sellTransactionCount
          : sellTransactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      currencyItem: null == currencyItem
          ? _value.currencyItem
          : currencyItem // ignore: cast_nullable_to_non_nullable
              as List<ExchangeItem>,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionItemCopyWith<$Res>? get currentTransaction {
    if (_value.currentTransaction == null) {
      return null;
    }

    return $TransactionItemCopyWith<$Res>(_value.currentTransaction!, (value) {
      return _then(_value.copyWith(currentTransaction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReceiptServiceStateCopyWith<$Res>
    implements $ReceiptServiceStateCopyWith<$Res> {
  factory _$$_ReceiptServiceStateCopyWith(_$_ReceiptServiceState value,
          $Res Function(_$_ReceiptServiceState) then) =
      __$$_ReceiptServiceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransactionItem? currentTransaction,
      double totalItemAmount,
      double totalItemPrice,
      double totalBuyPrice,
      double totalSellPrice,
      int sellTransactionCount,
      List<ExchangeItem> currencyItem,
      Transaction transaction,
      PaymentMethod payment});

  @override
  $TransactionItemCopyWith<$Res>? get currentTransaction;
}

/// @nodoc
class __$$_ReceiptServiceStateCopyWithImpl<$Res>
    extends _$ReceiptServiceStateCopyWithImpl<$Res, _$_ReceiptServiceState>
    implements _$$_ReceiptServiceStateCopyWith<$Res> {
  __$$_ReceiptServiceStateCopyWithImpl(_$_ReceiptServiceState _value,
      $Res Function(_$_ReceiptServiceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTransaction = freezed,
    Object? totalItemAmount = null,
    Object? totalItemPrice = null,
    Object? totalBuyPrice = null,
    Object? totalSellPrice = null,
    Object? sellTransactionCount = null,
    Object? currencyItem = null,
    Object? transaction = null,
    Object? payment = null,
  }) {
    return _then(_$_ReceiptServiceState(
      freezed == currentTransaction
          ? _value.currentTransaction
          : currentTransaction // ignore: cast_nullable_to_non_nullable
              as TransactionItem?,
      null == totalItemAmount
          ? _value.totalItemAmount
          : totalItemAmount // ignore: cast_nullable_to_non_nullable
              as double,
      null == totalItemPrice
          ? _value.totalItemPrice
          : totalItemPrice // ignore: cast_nullable_to_non_nullable
              as double,
      null == totalBuyPrice
          ? _value.totalBuyPrice
          : totalBuyPrice // ignore: cast_nullable_to_non_nullable
              as double,
      null == totalSellPrice
          ? _value.totalSellPrice
          : totalSellPrice // ignore: cast_nullable_to_non_nullable
              as double,
      null == sellTransactionCount
          ? _value.sellTransactionCount
          : sellTransactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == currencyItem
          ? _value._currencyItem
          : currencyItem // ignore: cast_nullable_to_non_nullable
              as List<ExchangeItem>,
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceiptServiceState extends _ReceiptServiceState {
  const _$_ReceiptServiceState(
      this.currentTransaction,
      this.totalItemAmount,
      this.totalItemPrice,
      this.totalBuyPrice,
      this.totalSellPrice,
      this.sellTransactionCount,
      final List<ExchangeItem> currencyItem,
      this.transaction,
      this.payment)
      : _currencyItem = currencyItem,
        super._();

  factory _$_ReceiptServiceState.fromJson(Map<String, dynamic> json) =>
      _$$_ReceiptServiceStateFromJson(json);

  @override
  final TransactionItem? currentTransaction;
  @override
  final double totalItemAmount;
  @override
  final double totalItemPrice;
  @override
  final double totalBuyPrice;
  @override
  final double totalSellPrice;
  @override
  final int sellTransactionCount;
  final List<ExchangeItem> _currencyItem;
  @override
  List<ExchangeItem> get currencyItem {
    if (_currencyItem is EqualUnmodifiableListView) return _currencyItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencyItem);
  }

  @override
  final Transaction transaction;
  @override
  final PaymentMethod payment;

  @override
  String toString() {
    return 'ReceiptServiceState(currentTransaction: $currentTransaction, totalItemAmount: $totalItemAmount, totalItemPrice: $totalItemPrice, totalBuyPrice: $totalBuyPrice, totalSellPrice: $totalSellPrice, sellTransactionCount: $sellTransactionCount, currencyItem: $currencyItem, transaction: $transaction, payment: $payment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceiptServiceState &&
            (identical(other.currentTransaction, currentTransaction) ||
                other.currentTransaction == currentTransaction) &&
            (identical(other.totalItemAmount, totalItemAmount) ||
                other.totalItemAmount == totalItemAmount) &&
            (identical(other.totalItemPrice, totalItemPrice) ||
                other.totalItemPrice == totalItemPrice) &&
            (identical(other.totalBuyPrice, totalBuyPrice) ||
                other.totalBuyPrice == totalBuyPrice) &&
            (identical(other.totalSellPrice, totalSellPrice) ||
                other.totalSellPrice == totalSellPrice) &&
            (identical(other.sellTransactionCount, sellTransactionCount) ||
                other.sellTransactionCount == sellTransactionCount) &&
            const DeepCollectionEquality()
                .equals(other._currencyItem, _currencyItem) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.payment, payment) || other.payment == payment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentTransaction,
      totalItemAmount,
      totalItemPrice,
      totalBuyPrice,
      totalSellPrice,
      sellTransactionCount,
      const DeepCollectionEquality().hash(_currencyItem),
      transaction,
      payment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceiptServiceStateCopyWith<_$_ReceiptServiceState> get copyWith =>
      __$$_ReceiptServiceStateCopyWithImpl<_$_ReceiptServiceState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceiptServiceStateToJson(
      this,
    );
  }
}

abstract class _ReceiptServiceState extends ReceiptServiceState {
  const factory _ReceiptServiceState(
      final TransactionItem? currentTransaction,
      final double totalItemAmount,
      final double totalItemPrice,
      final double totalBuyPrice,
      final double totalSellPrice,
      final int sellTransactionCount,
      final List<ExchangeItem> currencyItem,
      final Transaction transaction,
      final PaymentMethod payment) = _$_ReceiptServiceState;
  const _ReceiptServiceState._() : super._();

  factory _ReceiptServiceState.fromJson(Map<String, dynamic> json) =
      _$_ReceiptServiceState.fromJson;

  @override
  TransactionItem? get currentTransaction;
  @override
  double get totalItemAmount;
  @override
  double get totalItemPrice;
  @override
  double get totalBuyPrice;
  @override
  double get totalSellPrice;
  @override
  int get sellTransactionCount;
  @override
  List<ExchangeItem> get currencyItem;
  @override
  Transaction get transaction;
  @override
  PaymentMethod get payment;
  @override
  @JsonKey(ignore: true)
  _$$_ReceiptServiceStateCopyWith<_$_ReceiptServiceState> get copyWith =>
      throw _privateConstructorUsedError;
}
