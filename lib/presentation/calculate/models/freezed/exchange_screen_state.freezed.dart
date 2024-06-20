// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../exchange_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExchangeScreenState _$ExchangeScreenStateFromJson(Map<String, dynamic> json) {
  return _ExchangeScreenState.fromJson(json);
}

/// @nodoc
mixin _$ExchangeScreenState {
  bool get isSave => throw _privateConstructorUsedError;
  bool get isEdit => throw _privateConstructorUsedError;
  bool get isCurrencyLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExchangeScreenStateCopyWith<ExchangeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangeScreenStateCopyWith<$Res> {
  factory $ExchangeScreenStateCopyWith(
          ExchangeScreenState value, $Res Function(ExchangeScreenState) then) =
      _$ExchangeScreenStateCopyWithImpl<$Res, ExchangeScreenState>;
  @useResult
  $Res call({bool isSave, bool isEdit, bool isCurrencyLoading});
}

/// @nodoc
class _$ExchangeScreenStateCopyWithImpl<$Res, $Val extends ExchangeScreenState>
    implements $ExchangeScreenStateCopyWith<$Res> {
  _$ExchangeScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSave = null,
    Object? isEdit = null,
    Object? isCurrencyLoading = null,
  }) {
    return _then(_value.copyWith(
      isSave: null == isSave
          ? _value.isSave
          : isSave // ignore: cast_nullable_to_non_nullable
              as bool,
      isEdit: null == isEdit
          ? _value.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurrencyLoading: null == isCurrencyLoading
          ? _value.isCurrencyLoading
          : isCurrencyLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExchangeScreenStateImplCopyWith<$Res>
    implements $ExchangeScreenStateCopyWith<$Res> {
  factory _$$ExchangeScreenStateImplCopyWith(_$ExchangeScreenStateImpl value,
          $Res Function(_$ExchangeScreenStateImpl) then) =
      __$$ExchangeScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSave, bool isEdit, bool isCurrencyLoading});
}

/// @nodoc
class __$$ExchangeScreenStateImplCopyWithImpl<$Res>
    extends _$ExchangeScreenStateCopyWithImpl<$Res, _$ExchangeScreenStateImpl>
    implements _$$ExchangeScreenStateImplCopyWith<$Res> {
  __$$ExchangeScreenStateImplCopyWithImpl(_$ExchangeScreenStateImpl _value,
      $Res Function(_$ExchangeScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSave = null,
    Object? isEdit = null,
    Object? isCurrencyLoading = null,
  }) {
    return _then(_$ExchangeScreenStateImpl(
      isSave: null == isSave
          ? _value.isSave
          : isSave // ignore: cast_nullable_to_non_nullable
              as bool,
      isEdit: null == isEdit
          ? _value.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurrencyLoading: null == isCurrencyLoading
          ? _value.isCurrencyLoading
          : isCurrencyLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExchangeScreenStateImpl extends _ExchangeScreenState {
  const _$ExchangeScreenStateImpl(
      {required this.isSave,
      required this.isEdit,
      required this.isCurrencyLoading})
      : super._();

  factory _$ExchangeScreenStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExchangeScreenStateImplFromJson(json);

  @override
  final bool isSave;
  @override
  final bool isEdit;
  @override
  final bool isCurrencyLoading;

  @override
  String toString() {
    return 'ExchangeScreenState(isSave: $isSave, isEdit: $isEdit, isCurrencyLoading: $isCurrencyLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeScreenStateImpl &&
            (identical(other.isSave, isSave) || other.isSave == isSave) &&
            (identical(other.isEdit, isEdit) || other.isEdit == isEdit) &&
            (identical(other.isCurrencyLoading, isCurrencyLoading) ||
                other.isCurrencyLoading == isCurrencyLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isSave, isEdit, isCurrencyLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeScreenStateImplCopyWith<_$ExchangeScreenStateImpl> get copyWith =>
      __$$ExchangeScreenStateImplCopyWithImpl<_$ExchangeScreenStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExchangeScreenStateImplToJson(
      this,
    );
  }
}

abstract class _ExchangeScreenState extends ExchangeScreenState {
  const factory _ExchangeScreenState(
      {required final bool isSave,
      required final bool isEdit,
      required final bool isCurrencyLoading}) = _$ExchangeScreenStateImpl;
  const _ExchangeScreenState._() : super._();

  factory _ExchangeScreenState.fromJson(Map<String, dynamic> json) =
      _$ExchangeScreenStateImpl.fromJson;

  @override
  bool get isSave;
  @override
  bool get isEdit;
  @override
  bool get isCurrencyLoading;
  @override
  @JsonKey(ignore: true)
  _$$ExchangeScreenStateImplCopyWith<_$ExchangeScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
