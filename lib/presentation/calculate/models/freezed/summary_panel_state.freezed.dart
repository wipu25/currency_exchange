// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../summary_panel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SummaryPanelState _$SummaryPanelStateFromJson(Map<String, dynamic> json) {
  return _SummaryPanelState.fromJson(json);
}

/// @nodoc
mixin _$SummaryPanelState {
  TransactionItem? get currentTransaction => throw _privateConstructorUsedError;
  double get totalBuyPrice => throw _privateConstructorUsedError;
  double get totalSellPrice => throw _privateConstructorUsedError;
  List<ExchangeItem> get currencyItem => throw _privateConstructorUsedError;
  PaymentMethod get payment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SummaryPanelStateCopyWith<SummaryPanelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryPanelStateCopyWith<$Res> {
  factory $SummaryPanelStateCopyWith(
          SummaryPanelState value, $Res Function(SummaryPanelState) then) =
      _$SummaryPanelStateCopyWithImpl<$Res, SummaryPanelState>;
  @useResult
  $Res call(
      {TransactionItem? currentTransaction,
      double totalBuyPrice,
      double totalSellPrice,
      List<ExchangeItem> currencyItem,
      PaymentMethod payment});

  $TransactionItemCopyWith<$Res>? get currentTransaction;
}

/// @nodoc
class _$SummaryPanelStateCopyWithImpl<$Res, $Val extends SummaryPanelState>
    implements $SummaryPanelStateCopyWith<$Res> {
  _$SummaryPanelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTransaction = freezed,
    Object? totalBuyPrice = null,
    Object? totalSellPrice = null,
    Object? currencyItem = null,
    Object? payment = null,
  }) {
    return _then(_value.copyWith(
      currentTransaction: freezed == currentTransaction
          ? _value.currentTransaction
          : currentTransaction // ignore: cast_nullable_to_non_nullable
              as TransactionItem?,
      totalBuyPrice: null == totalBuyPrice
          ? _value.totalBuyPrice
          : totalBuyPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalSellPrice: null == totalSellPrice
          ? _value.totalSellPrice
          : totalSellPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currencyItem: null == currencyItem
          ? _value.currencyItem
          : currencyItem // ignore: cast_nullable_to_non_nullable
              as List<ExchangeItem>,
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
abstract class _$$SummaryPanelStateImplCopyWith<$Res>
    implements $SummaryPanelStateCopyWith<$Res> {
  factory _$$SummaryPanelStateImplCopyWith(_$SummaryPanelStateImpl value,
          $Res Function(_$SummaryPanelStateImpl) then) =
      __$$SummaryPanelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransactionItem? currentTransaction,
      double totalBuyPrice,
      double totalSellPrice,
      List<ExchangeItem> currencyItem,
      PaymentMethod payment});

  @override
  $TransactionItemCopyWith<$Res>? get currentTransaction;
}

/// @nodoc
class __$$SummaryPanelStateImplCopyWithImpl<$Res>
    extends _$SummaryPanelStateCopyWithImpl<$Res, _$SummaryPanelStateImpl>
    implements _$$SummaryPanelStateImplCopyWith<$Res> {
  __$$SummaryPanelStateImplCopyWithImpl(_$SummaryPanelStateImpl _value,
      $Res Function(_$SummaryPanelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTransaction = freezed,
    Object? totalBuyPrice = null,
    Object? totalSellPrice = null,
    Object? currencyItem = null,
    Object? payment = null,
  }) {
    return _then(_$SummaryPanelStateImpl(
      freezed == currentTransaction
          ? _value.currentTransaction
          : currentTransaction // ignore: cast_nullable_to_non_nullable
              as TransactionItem?,
      null == totalBuyPrice
          ? _value.totalBuyPrice
          : totalBuyPrice // ignore: cast_nullable_to_non_nullable
              as double,
      null == totalSellPrice
          ? _value.totalSellPrice
          : totalSellPrice // ignore: cast_nullable_to_non_nullable
              as double,
      null == currencyItem
          ? _value._currencyItem
          : currencyItem // ignore: cast_nullable_to_non_nullable
              as List<ExchangeItem>,
      null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryPanelStateImpl extends _SummaryPanelState {
  const _$SummaryPanelStateImpl(this.currentTransaction, this.totalBuyPrice,
      this.totalSellPrice, final List<ExchangeItem> currencyItem, this.payment)
      : _currencyItem = currencyItem,
        super._();

  factory _$SummaryPanelStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryPanelStateImplFromJson(json);

  @override
  final TransactionItem? currentTransaction;
  @override
  final double totalBuyPrice;
  @override
  final double totalSellPrice;
  final List<ExchangeItem> _currencyItem;
  @override
  List<ExchangeItem> get currencyItem {
    if (_currencyItem is EqualUnmodifiableListView) return _currencyItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencyItem);
  }

  @override
  final PaymentMethod payment;

  @override
  String toString() {
    return 'SummaryPanelState(currentTransaction: $currentTransaction, totalBuyPrice: $totalBuyPrice, totalSellPrice: $totalSellPrice, currencyItem: $currencyItem, payment: $payment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryPanelStateImpl &&
            (identical(other.currentTransaction, currentTransaction) ||
                other.currentTransaction == currentTransaction) &&
            (identical(other.totalBuyPrice, totalBuyPrice) ||
                other.totalBuyPrice == totalBuyPrice) &&
            (identical(other.totalSellPrice, totalSellPrice) ||
                other.totalSellPrice == totalSellPrice) &&
            const DeepCollectionEquality()
                .equals(other._currencyItem, _currencyItem) &&
            (identical(other.payment, payment) || other.payment == payment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentTransaction,
      totalBuyPrice,
      totalSellPrice,
      const DeepCollectionEquality().hash(_currencyItem),
      payment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryPanelStateImplCopyWith<_$SummaryPanelStateImpl> get copyWith =>
      __$$SummaryPanelStateImplCopyWithImpl<_$SummaryPanelStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryPanelStateImplToJson(
      this,
    );
  }
}

abstract class _SummaryPanelState extends SummaryPanelState {
  const factory _SummaryPanelState(
      final TransactionItem? currentTransaction,
      final double totalBuyPrice,
      final double totalSellPrice,
      final List<ExchangeItem> currencyItem,
      final PaymentMethod payment) = _$SummaryPanelStateImpl;
  const _SummaryPanelState._() : super._();

  factory _SummaryPanelState.fromJson(Map<String, dynamic> json) =
      _$SummaryPanelStateImpl.fromJson;

  @override
  TransactionItem? get currentTransaction;
  @override
  double get totalBuyPrice;
  @override
  double get totalSellPrice;
  @override
  List<ExchangeItem> get currencyItem;
  @override
  PaymentMethod get payment;
  @override
  @JsonKey(ignore: true)
  _$$SummaryPanelStateImplCopyWith<_$SummaryPanelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
