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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SummaryDialogState _$SummaryDialogStateFromJson(Map<String, dynamic> json) {
  return _SummaryDialogState.fromJson(json);
}

/// @nodoc
mixin _$SummaryDialogState {
  ClientInfo? get clientInfo => throw _privateConstructorUsedError;
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
      {ClientInfo? clientInfo, bool isInfoFilled, BillOperation billOperation});

  $ClientInfoCopyWith<$Res>? get clientInfo;
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
    Object? clientInfo = freezed,
    Object? isInfoFilled = null,
    Object? billOperation = null,
  }) {
    return _then(_value.copyWith(
      clientInfo: freezed == clientInfo
          ? _value.clientInfo
          : clientInfo // ignore: cast_nullable_to_non_nullable
              as ClientInfo?,
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
abstract class _$$SummaryDialogStateImplCopyWith<$Res>
    implements $SummaryDialogStateCopyWith<$Res> {
  factory _$$SummaryDialogStateImplCopyWith(_$SummaryDialogStateImpl value,
          $Res Function(_$SummaryDialogStateImpl) then) =
      __$$SummaryDialogStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ClientInfo? clientInfo, bool isInfoFilled, BillOperation billOperation});

  @override
  $ClientInfoCopyWith<$Res>? get clientInfo;
}

/// @nodoc
class __$$SummaryDialogStateImplCopyWithImpl<$Res>
    extends _$SummaryDialogStateCopyWithImpl<$Res, _$SummaryDialogStateImpl>
    implements _$$SummaryDialogStateImplCopyWith<$Res> {
  __$$SummaryDialogStateImplCopyWithImpl(_$SummaryDialogStateImpl _value,
      $Res Function(_$SummaryDialogStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientInfo = freezed,
    Object? isInfoFilled = null,
    Object? billOperation = null,
  }) {
    return _then(_$SummaryDialogStateImpl(
      freezed == clientInfo
          ? _value.clientInfo
          : clientInfo // ignore: cast_nullable_to_non_nullable
              as ClientInfo?,
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
class _$SummaryDialogStateImpl extends _SummaryDialogState {
  const _$SummaryDialogStateImpl(
      this.clientInfo, this.isInfoFilled, this.billOperation)
      : super._();

  factory _$SummaryDialogStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryDialogStateImplFromJson(json);

  @override
  final ClientInfo? clientInfo;
  @override
  final bool isInfoFilled;
  @override
  final BillOperation billOperation;

  @override
  String toString() {
    return 'SummaryDialogState(clientInfo: $clientInfo, isInfoFilled: $isInfoFilled, billOperation: $billOperation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryDialogStateImpl &&
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
  _$$SummaryDialogStateImplCopyWith<_$SummaryDialogStateImpl> get copyWith =>
      __$$SummaryDialogStateImplCopyWithImpl<_$SummaryDialogStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryDialogStateImplToJson(
      this,
    );
  }
}

abstract class _SummaryDialogState extends SummaryDialogState {
  const factory _SummaryDialogState(
      final ClientInfo? clientInfo,
      final bool isInfoFilled,
      final BillOperation billOperation) = _$SummaryDialogStateImpl;
  const _SummaryDialogState._() : super._();

  factory _SummaryDialogState.fromJson(Map<String, dynamic> json) =
      _$SummaryDialogStateImpl.fromJson;

  @override
  ClientInfo? get clientInfo;
  @override
  bool get isInfoFilled;
  @override
  BillOperation get billOperation;
  @override
  @JsonKey(ignore: true)
  _$$SummaryDialogStateImplCopyWith<_$SummaryDialogStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
