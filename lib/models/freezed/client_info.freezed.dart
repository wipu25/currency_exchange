// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../client_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientInfo _$ClientInfoFromJson(Map<String, dynamic> json) {
  return _ClientInfo.fromJson(json);
}

/// @nodoc
mixin _$ClientInfo {
  String? get name => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientInfoCopyWith<ClientInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientInfoCopyWith<$Res> {
  factory $ClientInfoCopyWith(
          ClientInfo value, $Res Function(ClientInfo) then) =
      _$ClientInfoCopyWithImpl<$Res, ClientInfo>;
  @useResult
  $Res call({String? name, String? id, String? address});
}

/// @nodoc
class _$ClientInfoCopyWithImpl<$Res, $Val extends ClientInfo>
    implements $ClientInfoCopyWith<$Res> {
  _$ClientInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClientInfoCopyWith<$Res>
    implements $ClientInfoCopyWith<$Res> {
  factory _$$_ClientInfoCopyWith(
          _$_ClientInfo value, $Res Function(_$_ClientInfo) then) =
      __$$_ClientInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? id, String? address});
}

/// @nodoc
class __$$_ClientInfoCopyWithImpl<$Res>
    extends _$ClientInfoCopyWithImpl<$Res, _$_ClientInfo>
    implements _$$_ClientInfoCopyWith<$Res> {
  __$$_ClientInfoCopyWithImpl(
      _$_ClientInfo _value, $Res Function(_$_ClientInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_ClientInfo(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientInfo extends _ClientInfo {
  const _$_ClientInfo({this.name, this.id, this.address}) : super._();

  factory _$_ClientInfo.fromJson(Map<String, dynamic> json) =>
      _$$_ClientInfoFromJson(json);

  @override
  final String? name;
  @override
  final String? id;
  @override
  final String? address;

  @override
  String toString() {
    return 'ClientInfo(name: $name, id: $id, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClientInfo &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClientInfoCopyWith<_$_ClientInfo> get copyWith =>
      __$$_ClientInfoCopyWithImpl<_$_ClientInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientInfoToJson(
      this,
    );
  }
}

abstract class _ClientInfo extends ClientInfo {
  const factory _ClientInfo(
      {final String? name,
      final String? id,
      final String? address}) = _$_ClientInfo;
  const _ClientInfo._() : super._();

  factory _ClientInfo.fromJson(Map<String, dynamic> json) =
      _$_ClientInfo.fromJson;

  @override
  String? get name;
  @override
  String? get id;
  @override
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$_ClientInfoCopyWith<_$_ClientInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
