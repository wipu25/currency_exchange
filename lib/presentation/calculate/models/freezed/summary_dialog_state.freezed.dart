// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../summary_dialog_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SummaryDialogState _$SummaryDialogStateFromJson(Map<String, dynamic> json) {
  return _SummaryDialogState.fromJson(json);
}

/// @nodoc
mixin _$SummaryDialogState {
  ClientInfo get clientInfo => throw _privateConstructorUsedError;
  bool get isInfoFilled => throw _privateConstructorUsedError;
  BillOperation get billOperation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SummaryDialogStateCopyWith<SummaryDialogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryDialogStateCopyWith<$Res> {
  factory $SummaryDialogStateCopyWith(
          SummaryDialogState value, $Res Function(SummaryDialogState) then) =
      _$SummaryDialogStateCopyWithImpl<$Res, SummaryDialogState>;
  @useResult
  $Res call(
      {ClientInfo clientInfo, bool isInfoFilled, BillOperation billOperation});

  $ClientInfoCopyWith<$Res> get clientInfo;
}

/// @nodoc
class _$SummaryDialogStateCopyWithImpl<$Res, $Val extends SummaryDialogState>
    implements $SummaryDialogStateCopyWith<$Res> {
  _$SummaryDialogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientInfo = null,
    Object? isInfoFilled = null,
    Object? billOperation = null,
  }) {
    return _then(_value.copyWith(
      clientInfo: null == clientInfo
          ? _value.clientInfo
          : clientInfo // ignore: cast_nullable_to_non_nullable
              as ClientInfo,
      isInfoFilled: null == isInfoFilled
          ? _value.isInfoFilled
          : isInfoFilled // ignore: cast_nullable_to_non_nullable
              as bool,
      billOperation: null == billOperation
          ? _value.billOperation
          : billOperation // ignore: cast_nullable_to_non_nullable
              as BillOperation,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientInfoCopyWith<$Res> get clientInfo {
    return $ClientInfoCopyWith<$Res>(_value.clientInfo, (value) {
      return _then(_value.copyWith(clientInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SummaryDialogStateCopyWith<$Res>
    implements $SummaryDialogStateCopyWith<$Res> {
  factory _$$_SummaryDialogStateCopyWith(_$_SummaryDialogState value,
          $Res Function(_$_SummaryDialogState) then) =
      __$$_SummaryDialogStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ClientInfo clientInfo, bool isInfoFilled, BillOperation billOperation});

  @override
  $ClientInfoCopyWith<$Res> get clientInfo;
}

/// @nodoc
class __$$_SummaryDialogStateCopyWithImpl<$Res>
    extends _$SummaryDialogStateCopyWithImpl<$Res, _$_SummaryDialogState>
    implements _$$_SummaryDialogStateCopyWith<$Res> {
  __$$_SummaryDialogStateCopyWithImpl(
      _$_SummaryDialogState _value, $Res Function(_$_SummaryDialogState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientInfo = null,
    Object? isInfoFilled = null,
    Object? billOperation = null,
  }) {
    return _then(_$_SummaryDialogState(
      null == clientInfo
          ? _value.clientInfo
          : clientInfo // ignore: cast_nullable_to_non_nullable
              as ClientInfo,
      null == isInfoFilled
          ? _value.isInfoFilled
          : isInfoFilled // ignore: cast_nullable_to_non_nullable
              as bool,
      null == billOperation
          ? _value.billOperation
          : billOperation // ignore: cast_nullable_to_non_nullable
              as BillOperation,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SummaryDialogState extends _SummaryDialogState {
  const _$_SummaryDialogState(
      this.clientInfo, this.isInfoFilled, this.billOperation)
      : super._();

  factory _$_SummaryDialogState.fromJson(Map<String, dynamic> json) =>
      _$$_SummaryDialogStateFromJson(json);

  @override
  final ClientInfo clientInfo;
  @override
  final bool isInfoFilled;
  @override
  final BillOperation billOperation;

  @override
  String toString() {
    return 'SummaryDialogState(clientInfo: $clientInfo, isInfoFilled: $isInfoFilled, billOperation: $billOperation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SummaryDialogState &&
            (identical(other.clientInfo, clientInfo) ||
                other.clientInfo == clientInfo) &&
            (identical(other.isInfoFilled, isInfoFilled) ||
                other.isInfoFilled == isInfoFilled) &&
            (identical(other.billOperation, billOperation) ||
                other.billOperation == billOperation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clientInfo, isInfoFilled, billOperation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SummaryDialogStateCopyWith<_$_SummaryDialogState> get copyWith =>
      __$$_SummaryDialogStateCopyWithImpl<_$_SummaryDialogState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SummaryDialogStateToJson(
      this,
    );
  }
}

abstract class _SummaryDialogState extends SummaryDialogState {
  const factory _SummaryDialogState(
      final ClientInfo clientInfo,
      final bool isInfoFilled,
      final BillOperation billOperation) = _$_SummaryDialogState;
  const _SummaryDialogState._() : super._();

  factory _SummaryDialogState.fromJson(Map<String, dynamic> json) =
      _$_SummaryDialogState.fromJson;

  @override
  ClientInfo get clientInfo;
  @override
  bool get isInfoFilled;
  @override
  BillOperation get billOperation;
  @override
  @JsonKey(ignore: true)
  _$$_SummaryDialogStateCopyWith<_$_SummaryDialogState> get copyWith =>
      throw _privateConstructorUsedError;
}
