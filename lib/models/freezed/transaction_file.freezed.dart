// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../transaction_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionFile _$TransactionFileFromJson(Map<String, dynamic> json) {
  return _TransactionFile.fromJson(json);
}

/// @nodoc
mixin _$TransactionFile {
  List<TransactionItem> get transaction => throw _privateConstructorUsedError;
  double? get totalBuyPrice => throw _privateConstructorUsedError;
  double? get totalSellPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionFileCopyWith<TransactionFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionFileCopyWith<$Res> {
  factory $TransactionFileCopyWith(
          TransactionFile value, $Res Function(TransactionFile) then) =
      _$TransactionFileCopyWithImpl<$Res, TransactionFile>;
  @useResult
  $Res call(
      {List<TransactionItem> transaction,
      double? totalBuyPrice,
      double? totalSellPrice});
}

/// @nodoc
class _$TransactionFileCopyWithImpl<$Res, $Val extends TransactionFile>
    implements $TransactionFileCopyWith<$Res> {
  _$TransactionFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
    Object? totalBuyPrice = freezed,
    Object? totalSellPrice = freezed,
  }) {
    return _then(_value.copyWith(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      totalBuyPrice: freezed == totalBuyPrice
          ? _value.totalBuyPrice
          : totalBuyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSellPrice: freezed == totalSellPrice
          ? _value.totalSellPrice
          : totalSellPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionFileImplCopyWith<$Res>
    implements $TransactionFileCopyWith<$Res> {
  factory _$$TransactionFileImplCopyWith(_$TransactionFileImpl value,
          $Res Function(_$TransactionFileImpl) then) =
      __$$TransactionFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TransactionItem> transaction,
      double? totalBuyPrice,
      double? totalSellPrice});
}

/// @nodoc
class __$$TransactionFileImplCopyWithImpl<$Res>
    extends _$TransactionFileCopyWithImpl<$Res, _$TransactionFileImpl>
    implements _$$TransactionFileImplCopyWith<$Res> {
  __$$TransactionFileImplCopyWithImpl(
      _$TransactionFileImpl _value, $Res Function(_$TransactionFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
    Object? totalBuyPrice = freezed,
    Object? totalSellPrice = freezed,
  }) {
    return _then(_$TransactionFileImpl(
      transaction: null == transaction
          ? _value._transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      totalBuyPrice: freezed == totalBuyPrice
          ? _value.totalBuyPrice
          : totalBuyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSellPrice: freezed == totalSellPrice
          ? _value.totalSellPrice
          : totalSellPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionFileImpl extends _TransactionFile {
  const _$TransactionFileImpl(
      {required final List<TransactionItem> transaction,
      this.totalBuyPrice,
      this.totalSellPrice})
      : _transaction = transaction,
        super._();

  factory _$TransactionFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionFileImplFromJson(json);

  final List<TransactionItem> _transaction;
  @override
  List<TransactionItem> get transaction {
    if (_transaction is EqualUnmodifiableListView) return _transaction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transaction);
  }

  @override
  final double? totalBuyPrice;
  @override
  final double? totalSellPrice;

  @override
  String toString() {
    return 'TransactionFile(transaction: $transaction, totalBuyPrice: $totalBuyPrice, totalSellPrice: $totalSellPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionFileImpl &&
            const DeepCollectionEquality()
                .equals(other._transaction, _transaction) &&
            (identical(other.totalBuyPrice, totalBuyPrice) ||
                other.totalBuyPrice == totalBuyPrice) &&
            (identical(other.totalSellPrice, totalSellPrice) ||
                other.totalSellPrice == totalSellPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transaction),
      totalBuyPrice,
      totalSellPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionFileImplCopyWith<_$TransactionFileImpl> get copyWith =>
      __$$TransactionFileImplCopyWithImpl<_$TransactionFileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionFileImplToJson(
      this,
    );
  }
}

abstract class _TransactionFile extends TransactionFile {
  const factory _TransactionFile(
      {required final List<TransactionItem> transaction,
      final double? totalBuyPrice,
      final double? totalSellPrice}) = _$TransactionFileImpl;
  const _TransactionFile._() : super._();

  factory _TransactionFile.fromJson(Map<String, dynamic> json) =
      _$TransactionFileImpl.fromJson;

  @override
  List<TransactionItem> get transaction;
  @override
  double? get totalBuyPrice;
  @override
  double? get totalSellPrice;
  @override
  @JsonKey(ignore: true)
  _$$TransactionFileImplCopyWith<_$TransactionFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
