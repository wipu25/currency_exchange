// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../calculate_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalculateScreenState _$CalculateScreenStateFromJson(Map<String, dynamic> json) {
  return _CalculateScreenState.fromJson(json);
}

/// @nodoc
mixin _$CalculateScreenState {
  Country? get selectedCurrency => throw _privateConstructorUsedError;
  bool get isAddEnable => throw _privateConstructorUsedError;
  Transaction get transaction => throw _privateConstructorUsedError;
  List<CalculatedItem> get calculatedItem => throw _privateConstructorUsedError;
  int get currentInsert => throw _privateConstructorUsedError;
  double get totalItemAmount => throw _privateConstructorUsedError;
  double get totalItemPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalculateScreenStateCopyWith<CalculateScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculateScreenStateCopyWith<$Res> {
  factory $CalculateScreenStateCopyWith(CalculateScreenState value,
          $Res Function(CalculateScreenState) then) =
      _$CalculateScreenStateCopyWithImpl<$Res, CalculateScreenState>;
  @useResult
  $Res call(
      {Country? selectedCurrency,
      bool isAddEnable,
      Transaction transaction,
      List<CalculatedItem> calculatedItem,
      int currentInsert,
      double totalItemAmount,
      double totalItemPrice});

  $CountryCopyWith<$Res>? get selectedCurrency;
}

/// @nodoc
class _$CalculateScreenStateCopyWithImpl<$Res,
        $Val extends CalculateScreenState>
    implements $CalculateScreenStateCopyWith<$Res> {
  _$CalculateScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCurrency = freezed,
    Object? isAddEnable = null,
    Object? transaction = null,
    Object? calculatedItem = null,
    Object? currentInsert = null,
    Object? totalItemAmount = null,
    Object? totalItemPrice = null,
  }) {
    return _then(_value.copyWith(
      selectedCurrency: freezed == selectedCurrency
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as Country?,
      isAddEnable: null == isAddEnable
          ? _value.isAddEnable
          : isAddEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      calculatedItem: null == calculatedItem
          ? _value.calculatedItem
          : calculatedItem // ignore: cast_nullable_to_non_nullable
              as List<CalculatedItem>,
      currentInsert: null == currentInsert
          ? _value.currentInsert
          : currentInsert // ignore: cast_nullable_to_non_nullable
              as int,
      totalItemAmount: null == totalItemAmount
          ? _value.totalItemAmount
          : totalItemAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalItemPrice: null == totalItemPrice
          ? _value.totalItemPrice
          : totalItemPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryCopyWith<$Res>? get selectedCurrency {
    if (_value.selectedCurrency == null) {
      return null;
    }

    return $CountryCopyWith<$Res>(_value.selectedCurrency!, (value) {
      return _then(_value.copyWith(selectedCurrency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CalculateScreenStateImplCopyWith<$Res>
    implements $CalculateScreenStateCopyWith<$Res> {
  factory _$$CalculateScreenStateImplCopyWith(_$CalculateScreenStateImpl value,
          $Res Function(_$CalculateScreenStateImpl) then) =
      __$$CalculateScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Country? selectedCurrency,
      bool isAddEnable,
      Transaction transaction,
      List<CalculatedItem> calculatedItem,
      int currentInsert,
      double totalItemAmount,
      double totalItemPrice});

  @override
  $CountryCopyWith<$Res>? get selectedCurrency;
}

/// @nodoc
class __$$CalculateScreenStateImplCopyWithImpl<$Res>
    extends _$CalculateScreenStateCopyWithImpl<$Res, _$CalculateScreenStateImpl>
    implements _$$CalculateScreenStateImplCopyWith<$Res> {
  __$$CalculateScreenStateImplCopyWithImpl(_$CalculateScreenStateImpl _value,
      $Res Function(_$CalculateScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCurrency = freezed,
    Object? isAddEnable = null,
    Object? transaction = null,
    Object? calculatedItem = null,
    Object? currentInsert = null,
    Object? totalItemAmount = null,
    Object? totalItemPrice = null,
  }) {
    return _then(_$CalculateScreenStateImpl(
      freezed == selectedCurrency
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as Country?,
      null == isAddEnable
          ? _value.isAddEnable
          : isAddEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      null == calculatedItem
          ? _value._calculatedItem
          : calculatedItem // ignore: cast_nullable_to_non_nullable
              as List<CalculatedItem>,
      null == currentInsert
          ? _value.currentInsert
          : currentInsert // ignore: cast_nullable_to_non_nullable
              as int,
      null == totalItemAmount
          ? _value.totalItemAmount
          : totalItemAmount // ignore: cast_nullable_to_non_nullable
              as double,
      null == totalItemPrice
          ? _value.totalItemPrice
          : totalItemPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalculateScreenStateImpl extends _CalculateScreenState {
  const _$CalculateScreenStateImpl(
      this.selectedCurrency,
      this.isAddEnable,
      this.transaction,
      final List<CalculatedItem> calculatedItem,
      this.currentInsert,
      this.totalItemAmount,
      this.totalItemPrice)
      : _calculatedItem = calculatedItem,
        super._();

  factory _$CalculateScreenStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalculateScreenStateImplFromJson(json);

  @override
  final Country? selectedCurrency;
  @override
  final bool isAddEnable;
  @override
  final Transaction transaction;
  final List<CalculatedItem> _calculatedItem;
  @override
  List<CalculatedItem> get calculatedItem {
    if (_calculatedItem is EqualUnmodifiableListView) return _calculatedItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calculatedItem);
  }

  @override
  final int currentInsert;
  @override
  final double totalItemAmount;
  @override
  final double totalItemPrice;

  @override
  String toString() {
    return 'CalculateScreenState(selectedCurrency: $selectedCurrency, isAddEnable: $isAddEnable, transaction: $transaction, calculatedItem: $calculatedItem, currentInsert: $currentInsert, totalItemAmount: $totalItemAmount, totalItemPrice: $totalItemPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculateScreenStateImpl &&
            (identical(other.selectedCurrency, selectedCurrency) ||
                other.selectedCurrency == selectedCurrency) &&
            (identical(other.isAddEnable, isAddEnable) ||
                other.isAddEnable == isAddEnable) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            const DeepCollectionEquality()
                .equals(other._calculatedItem, _calculatedItem) &&
            (identical(other.currentInsert, currentInsert) ||
                other.currentInsert == currentInsert) &&
            (identical(other.totalItemAmount, totalItemAmount) ||
                other.totalItemAmount == totalItemAmount) &&
            (identical(other.totalItemPrice, totalItemPrice) ||
                other.totalItemPrice == totalItemPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedCurrency,
      isAddEnable,
      transaction,
      const DeepCollectionEquality().hash(_calculatedItem),
      currentInsert,
      totalItemAmount,
      totalItemPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculateScreenStateImplCopyWith<_$CalculateScreenStateImpl>
      get copyWith =>
          __$$CalculateScreenStateImplCopyWithImpl<_$CalculateScreenStateImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalculateScreenStateImplToJson(
      this,
    );
  }
}

abstract class _CalculateScreenState extends CalculateScreenState {
  const factory _CalculateScreenState(
      final Country? selectedCurrency,
      final bool isAddEnable,
      final Transaction transaction,
      final List<CalculatedItem> calculatedItem,
      final int currentInsert,
      final double totalItemAmount,
      final double totalItemPrice) = _$CalculateScreenStateImpl;
  const _CalculateScreenState._() : super._();

  factory _CalculateScreenState.fromJson(Map<String, dynamic> json) =
      _$CalculateScreenStateImpl.fromJson;

  @override
  Country? get selectedCurrency;
  @override
  bool get isAddEnable;
  @override
  Transaction get transaction;
  @override
  List<CalculatedItem> get calculatedItem;
  @override
  int get currentInsert;
  @override
  double get totalItemAmount;
  @override
  double get totalItemPrice;
  @override
  @JsonKey(ignore: true)
  _$$CalculateScreenStateImplCopyWith<_$CalculateScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
