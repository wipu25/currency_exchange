// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../history_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HistoryScreenState _$HistoryScreenStateFromJson(Map<String, dynamic> json) {
  return _HistoryScreenState.fromJson(json);
}

/// @nodoc
mixin _$HistoryScreenState {
  List<TransactionItem> get savedHistoryList =>
      throw _privateConstructorUsedError;
  List<TransactionItem> get historyList => throw _privateConstructorUsedError;
  bool get isFilterUpdate => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isCancel => throw _privateConstructorUsedError;
  bool get isClientInfoComplete => throw _privateConstructorUsedError;
  DateTime? get dateTimeDisplay => throw _privateConstructorUsedError;
  Map<String, bool> get currencyFilter => throw _privateConstructorUsedError;
  Map<String, bool> get paymentFilter => throw _privateConstructorUsedError;
  Map<String, bool> get transactionFilter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryScreenStateCopyWith<HistoryScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryScreenStateCopyWith<$Res> {
  factory $HistoryScreenStateCopyWith(
          HistoryScreenState value, $Res Function(HistoryScreenState) then) =
      _$HistoryScreenStateCopyWithImpl<$Res, HistoryScreenState>;
  @useResult
  $Res call(
      {List<TransactionItem> savedHistoryList,
      List<TransactionItem> historyList,
      bool isFilterUpdate,
      bool isLoading,
      bool isCancel,
      bool isClientInfoComplete,
      DateTime? dateTimeDisplay,
      Map<String, bool> currencyFilter,
      Map<String, bool> paymentFilter,
      Map<String, bool> transactionFilter});
}

/// @nodoc
class _$HistoryScreenStateCopyWithImpl<$Res, $Val extends HistoryScreenState>
    implements $HistoryScreenStateCopyWith<$Res> {
  _$HistoryScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedHistoryList = null,
    Object? historyList = null,
    Object? isFilterUpdate = null,
    Object? isLoading = null,
    Object? isCancel = null,
    Object? isClientInfoComplete = null,
    Object? dateTimeDisplay = freezed,
    Object? currencyFilter = null,
    Object? paymentFilter = null,
    Object? transactionFilter = null,
  }) {
    return _then(_value.copyWith(
      savedHistoryList: null == savedHistoryList
          ? _value.savedHistoryList
          : savedHistoryList // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      historyList: null == historyList
          ? _value.historyList
          : historyList // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      isFilterUpdate: null == isFilterUpdate
          ? _value.isFilterUpdate
          : isFilterUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancel: null == isCancel
          ? _value.isCancel
          : isCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      isClientInfoComplete: null == isClientInfoComplete
          ? _value.isClientInfoComplete
          : isClientInfoComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      dateTimeDisplay: freezed == dateTimeDisplay
          ? _value.dateTimeDisplay
          : dateTimeDisplay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currencyFilter: null == currencyFilter
          ? _value.currencyFilter
          : currencyFilter // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      paymentFilter: null == paymentFilter
          ? _value.paymentFilter
          : paymentFilter // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      transactionFilter: null == transactionFilter
          ? _value.transactionFilter
          : transactionFilter // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryScreenStateImplCopyWith<$Res>
    implements $HistoryScreenStateCopyWith<$Res> {
  factory _$$HistoryScreenStateImplCopyWith(_$HistoryScreenStateImpl value,
          $Res Function(_$HistoryScreenStateImpl) then) =
      __$$HistoryScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TransactionItem> savedHistoryList,
      List<TransactionItem> historyList,
      bool isFilterUpdate,
      bool isLoading,
      bool isCancel,
      bool isClientInfoComplete,
      DateTime? dateTimeDisplay,
      Map<String, bool> currencyFilter,
      Map<String, bool> paymentFilter,
      Map<String, bool> transactionFilter});
}

/// @nodoc
class __$$HistoryScreenStateImplCopyWithImpl<$Res>
    extends _$HistoryScreenStateCopyWithImpl<$Res, _$HistoryScreenStateImpl>
    implements _$$HistoryScreenStateImplCopyWith<$Res> {
  __$$HistoryScreenStateImplCopyWithImpl(_$HistoryScreenStateImpl _value,
      $Res Function(_$HistoryScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedHistoryList = null,
    Object? historyList = null,
    Object? isFilterUpdate = null,
    Object? isLoading = null,
    Object? isCancel = null,
    Object? isClientInfoComplete = null,
    Object? dateTimeDisplay = freezed,
    Object? currencyFilter = null,
    Object? paymentFilter = null,
    Object? transactionFilter = null,
  }) {
    return _then(_$HistoryScreenStateImpl(
      null == savedHistoryList
          ? _value._savedHistoryList
          : savedHistoryList // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      null == historyList
          ? _value._historyList
          : historyList // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      null == isFilterUpdate
          ? _value.isFilterUpdate
          : isFilterUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isCancel
          ? _value.isCancel
          : isCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isClientInfoComplete
          ? _value.isClientInfoComplete
          : isClientInfoComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      freezed == dateTimeDisplay
          ? _value.dateTimeDisplay
          : dateTimeDisplay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      null == currencyFilter
          ? _value._currencyFilter
          : currencyFilter // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      null == paymentFilter
          ? _value._paymentFilter
          : paymentFilter // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      null == transactionFilter
          ? _value._transactionFilter
          : transactionFilter // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryScreenStateImpl extends _HistoryScreenState {
  const _$HistoryScreenStateImpl(
      final List<TransactionItem> savedHistoryList,
      final List<TransactionItem> historyList,
      this.isFilterUpdate,
      this.isLoading,
      this.isCancel,
      this.isClientInfoComplete,
      this.dateTimeDisplay,
      final Map<String, bool> currencyFilter,
      final Map<String, bool> paymentFilter,
      final Map<String, bool> transactionFilter)
      : _savedHistoryList = savedHistoryList,
        _historyList = historyList,
        _currencyFilter = currencyFilter,
        _paymentFilter = paymentFilter,
        _transactionFilter = transactionFilter,
        super._();

  factory _$HistoryScreenStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryScreenStateImplFromJson(json);

  final List<TransactionItem> _savedHistoryList;
  @override
  List<TransactionItem> get savedHistoryList {
    if (_savedHistoryList is EqualUnmodifiableListView)
      return _savedHistoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedHistoryList);
  }

  final List<TransactionItem> _historyList;
  @override
  List<TransactionItem> get historyList {
    if (_historyList is EqualUnmodifiableListView) return _historyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historyList);
  }

  @override
  final bool isFilterUpdate;
  @override
  final bool isLoading;
  @override
  final bool isCancel;
  @override
  final bool isClientInfoComplete;
  @override
  final DateTime? dateTimeDisplay;
  final Map<String, bool> _currencyFilter;
  @override
  Map<String, bool> get currencyFilter {
    if (_currencyFilter is EqualUnmodifiableMapView) return _currencyFilter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_currencyFilter);
  }

  final Map<String, bool> _paymentFilter;
  @override
  Map<String, bool> get paymentFilter {
    if (_paymentFilter is EqualUnmodifiableMapView) return _paymentFilter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_paymentFilter);
  }

  final Map<String, bool> _transactionFilter;
  @override
  Map<String, bool> get transactionFilter {
    if (_transactionFilter is EqualUnmodifiableMapView)
      return _transactionFilter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_transactionFilter);
  }

  @override
  String toString() {
    return 'HistoryScreenState(savedHistoryList: $savedHistoryList, historyList: $historyList, isFilterUpdate: $isFilterUpdate, isLoading: $isLoading, isCancel: $isCancel, isClientInfoComplete: $isClientInfoComplete, dateTimeDisplay: $dateTimeDisplay, currencyFilter: $currencyFilter, paymentFilter: $paymentFilter, transactionFilter: $transactionFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryScreenStateImpl &&
            const DeepCollectionEquality()
                .equals(other._savedHistoryList, _savedHistoryList) &&
            const DeepCollectionEquality()
                .equals(other._historyList, _historyList) &&
            (identical(other.isFilterUpdate, isFilterUpdate) ||
                other.isFilterUpdate == isFilterUpdate) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isCancel, isCancel) ||
                other.isCancel == isCancel) &&
            (identical(other.isClientInfoComplete, isClientInfoComplete) ||
                other.isClientInfoComplete == isClientInfoComplete) &&
            (identical(other.dateTimeDisplay, dateTimeDisplay) ||
                other.dateTimeDisplay == dateTimeDisplay) &&
            const DeepCollectionEquality()
                .equals(other._currencyFilter, _currencyFilter) &&
            const DeepCollectionEquality()
                .equals(other._paymentFilter, _paymentFilter) &&
            const DeepCollectionEquality()
                .equals(other._transactionFilter, _transactionFilter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_savedHistoryList),
      const DeepCollectionEquality().hash(_historyList),
      isFilterUpdate,
      isLoading,
      isCancel,
      isClientInfoComplete,
      dateTimeDisplay,
      const DeepCollectionEquality().hash(_currencyFilter),
      const DeepCollectionEquality().hash(_paymentFilter),
      const DeepCollectionEquality().hash(_transactionFilter));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryScreenStateImplCopyWith<_$HistoryScreenStateImpl> get copyWith =>
      __$$HistoryScreenStateImplCopyWithImpl<_$HistoryScreenStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryScreenStateImplToJson(
      this,
    );
  }
}

abstract class _HistoryScreenState extends HistoryScreenState {
  const factory _HistoryScreenState(
      final List<TransactionItem> savedHistoryList,
      final List<TransactionItem> historyList,
      final bool isFilterUpdate,
      final bool isLoading,
      final bool isCancel,
      final bool isClientInfoComplete,
      final DateTime? dateTimeDisplay,
      final Map<String, bool> currencyFilter,
      final Map<String, bool> paymentFilter,
      final Map<String, bool> transactionFilter) = _$HistoryScreenStateImpl;
  const _HistoryScreenState._() : super._();

  factory _HistoryScreenState.fromJson(Map<String, dynamic> json) =
      _$HistoryScreenStateImpl.fromJson;

  @override
  List<TransactionItem> get savedHistoryList;
  @override
  List<TransactionItem> get historyList;
  @override
  bool get isFilterUpdate;
  @override
  bool get isLoading;
  @override
  bool get isCancel;
  @override
  bool get isClientInfoComplete;
  @override
  DateTime? get dateTimeDisplay;
  @override
  Map<String, bool> get currencyFilter;
  @override
  Map<String, bool> get paymentFilter;
  @override
  Map<String, bool> get transactionFilter;
  @override
  @JsonKey(ignore: true)
  _$$HistoryScreenStateImplCopyWith<_$HistoryScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
